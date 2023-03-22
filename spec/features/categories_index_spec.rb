require 'rails_helper'
require 'capybara/rspec'

base_url = 'http://localhost:3000'

RSpec.feature 'Categories#index view', type: :feature do
  before(:each) do
    @current_user = User.first
    @current_user.confirm if @current_user.confirmed_at.nil?
    @category = Category.find_by(user_id: @current_user.id)

    visit "#{base_url}/categories"
    fill_in 'Email', with: @current_user.email
    fill_in 'Password', with: '123456'
    click_button 'Log in'
  end

  scenario 'Displaying category names' do
    visit "#{base_url}/categories"
    expect(page).to have_content(@category.name, wait: 5)

    expect(body).to have_content(@category.name)
  end

  scenario 'Displaying category records total amount' do
    visit "#{base_url}/categories"
    total = 0
    expect(page).to have_content(total, wait: 5)
    expect(body).to have_content(total)
  end

  scenario 'Displaying Add category button' do
    visit "#{base_url}/categories"
    expect(page).to have_css('.add_category', wait: 5)
    expect(page).to have_css('.add_category')
  end

  scenario 'Add category by clicking on add button' do
    visit "#{base_url}/categories"
    add = page.all('.add_category')[0]
    add.click
    expect(page).to have_current_path("#{base_url}/categories/new")
  end
end
