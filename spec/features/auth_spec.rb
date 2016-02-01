require 'spec_helper'
require 'rails_helper'

feature "the signup process" do

  it "has a new user page" do
    visit('/users/new')
    expect(page).to have_content "Sign Up"
    expect(page).to have_content "Username"
    expect(page).to have_content "Password"

  end

  feature "signing up a user" do

    it "shows username on the homepage after signup" do
      visit('/users/new')
      fill_in('Username', with: "Mary")
      fill_in('Password', with: "kitten")
      click_button('Sign Up')
      expect(page).to have_content "Mary"
    end
  end

end

feature "logging in" do

  let(:user) { FactoryGirl.create(:user) }

  it "shows username on the homepage after login" do
    visit('/session/new')
    fill_in('Username', with: user.username)
    fill_in('Password', with: user.password)
    click_button('Log In')
    expect(page).to have_content user.username
  end
end

feature "logging out" do

  it "begins with logged out state" do
    visit('/session/new')
    expect(page).to have_button("Log In")
  end


  it "doesn't show username on the homepage after logout" do
    user = FactoryGirl.create(:user)
    visit('/session/new')
    fill_in('Username', with: user.username)
    fill_in('Password', with: user.password)
    click_button('Log In')
    click_button('Log Out')
    expect(page).not_to have_content(user.username)
  end

end
