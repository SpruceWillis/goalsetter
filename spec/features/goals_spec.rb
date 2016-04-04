require 'spec_helper'
require 'rails_helper'

feature "the goals process" do
  feature "shows index on login" do
    before(:each) do
      create_charles
    end

    scenario "shows index on login" do
      expect(page).to have_content("Goals")
    end

    scenario "shows link to create new goals" do
      expect(page).to have_content("New Goal")
    end
  end

  feature "can create new goals" do

    before(:each) do
      create_charles
      click_link('New Goal')
    end

    scenario "creating goal with invalid parameters redirects to page" do
      click_button('Create Goal')
      expect(page).to have_content("Title can't be blank")
      expect(page).to have_content("Body can't be blank")
    end

    scenario "creating goal with valid parameters displays goal show page" do
      fill_in 'Title', with: "blah blah blah"
      fill_in 'Body', with: "end exec"
      select('Not Public', from: 'Public')
      click_button('Create Goal')
      expect(page).to_not have_content("Title can't be blank")
      expect(page).to_not have_content("Body can't be blank")
    end



  end
end
