require 'rails_helper'

RSpec.describe Category, type: :model do
  current_user = User.first
  subject { Category.new(name: 'Infastructure', icon: 'https://media.gettyimages.com/id/600101128/photo/sea-bearing-cargo-ship.jpg?s=612x612&w=gi&k=20&c=td3GwO5C4JZSaqRplJWI4hrjBPFNIRUfsNpWvB5mNdY=', user: current_user) }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'measurement unit should be present' do
    subject.icon = nil
    expect(subject).to_not be_valid
  end


  it 'Subject should be valid' do
    expect(subject).to be_valid
  end
end
