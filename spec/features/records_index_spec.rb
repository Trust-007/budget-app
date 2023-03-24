require 'rails_helper'
require 'capybara/rspec'

base_url = 'http://localhost:3000'

RSpec.feature 'Records#index view', type: :feature do
  before(:each) do
    @current_user = User.first
    @current_user.confirm if @current_user.confirmed_at.nil?
    @category = Category.find_by(user_id: @current_user.id)
    @category.records << Record.all
    @records = @category.records
    @record = @records[0]
    visit "#{base_url}/categories/#{@category.id}/records"
    fill_in 'Email', with: @current_user.email
    fill_in 'Password', with: '123456'
    click_button 'Log in'
  end

  scenario 'Displaying record names' do
    visit "#{base_url}/categories/#{@category.id}/records"
    expect(page).to have_content(@record.name, wait: 5)
    expect(body).to have_content(@record.name)
  end

  scenario 'Displaying records amount' do
    visit "#{base_url}/categories/#{@category.id}/records"
    expect(page).to have_content(@record.amount, wait: 5)
    expect(body).to have_content(@record.amount)
  end

  scenario 'Displaying total records amount' do
    visit "#{base_url}/categories/#{@category.id}/records"
    total = @records.inject(0) { |sum, x| sum + x.amount }
    expect(page).to have_content(total, wait: 5)
    expect(body).to have_content(total)
  end
end

RSpec.feature 'Records#index handle button', type: :feature do
  before(:each) do
    @current_user = User.first
    @current_user.confirm if @current_user.confirmed_at.nil?
    @category = Category.find_by(user_id: @current_user.id)
    @category.records << Record.all
    @records = @category.records
    @record = @records[0]
    visit "#{base_url}/categories/#{@category.id}/records"
    fill_in 'Email', with: @current_user.email
    fill_in 'Password', with: '123456'
    click_button 'Log in'
  end

  scenario 'Displaying Add Transaction button' do
    visit "#{base_url}/categories/#{@category.id}/records"
    expect(page).to have_css('.add_category', wait: 5)
    expect(page).to have_css('.add_category')
  end

  scenario 'Add Transaction by clicking on add button' do
    visit "#{base_url}/categories/#{@category.id}/records"
    add = page.all('.add_category')[0]
    add.click
    expect(page).to have_current_path("#{base_url}/categories/#{@category.id}/records/new")
  end
end
