require 'spec_helper'
require 'rails_helper'

feature "creating a new goal" do
  let(:user) { FactoryGirl.create(:user) }

  before :each do
    # TODO: make helper method
    visit('/session/new')
    fill_in('Username', with: user.username)
    fill_in('Password', with: user.password)
    click_button('Log In')
  end

  it "has a create goal button" do
    visit user_goals_url(user)
    expect(page).to have_content("Create Goal")
  end

  it "has a new goal page" do
    visit new_goal_url
    expect(page).to have_content "Title"
    expect(page).to have_content "Details"
    expect(page).to have_button "Add Goal"
  end

  it "creates a new goal" do
    visit new_goal_url
    fill_in('Title', with: "Catch 10 mice")
    fill_in('Details', with: "Cat food from owner sucks.")
    choose('Public')
    click_button('Add Goal')
    expect(page).to have_content "Catch 10 mice"
    expect(page).to have_content "Cat food from owner sucks."
  end
end
