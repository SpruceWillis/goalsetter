require 'spec_helper'
require 'rails_helper'

feature "the signup process" do

  scenario "has a sign up page" do
    visit new_user_url
    expect(page).to have_content "Sign Up"
  end

  feature "signing up a user" do
    before(:each) do
      create_charles
    end

    scenario "shows username on the homepage after signup" do
      expect(page).to have_content "Goals"
    end

    scenario "shows username on the homepage after signup" do
        expect(page).to have_content "charles"
      end
    end
end

feature "logging in" do
  before(:each) do
    create_charles
    destroy_charles
    sign_in_charles
  end


  scenario "shows username on the homepage after login" do
    expect(page).to have_content "charles"
  end
end

feature "logging out" do

  scenario "begins with logged out state" do

  end

  scenario "doesn't show username on the homepage after logout" do

  end
end
