require_relative '../test_helper'

class UserCanCreateATask < FeatureTest

  def test_user_can_create_a_task
    # As a guest
    # When I visit "new task"
    visit '/tasks/new'
    # And I enter a valid title and description
    fill_in('task[title]', :with => 'Coffee')
    fill_in('task[description]', :with => 'Drink it!')
    # And I click submit
    click_button('submit')
    # Then a new task is created
    assert page.has_content?('Coffee')
  end

end
