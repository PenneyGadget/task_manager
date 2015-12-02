require_relative '../test_helper'

class UserSeesGreetingOnHomepage < FeatureTest

  def test_greeting_is_displayed
    # As a guest
    # When I visit the homepage
    visit '/'
    # Then I see "Penney's Task Manager
    # save_and_open_page would go here 
    within('#greeting') do
      assert page.has_content?("Penney's Task Manager")
    end
  end

end
