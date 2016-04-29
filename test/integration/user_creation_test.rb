require 'test_helper'

class UserCreationTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  test "a user can be created" do
    visit new_user_path

    fill_in "Name", with: "Jon Liss"
    fill_in "Username", with: "jdliss"
    fill_in "Email", with: "jdliss@email.com"
    fill_in "Password", with: "password"
    click_button "Create Account"

    assert page.has_content?("Welcome, jdliss")
  end
end
