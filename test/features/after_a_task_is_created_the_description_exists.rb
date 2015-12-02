require_relative '../test_helper'

class UsersTaskHasDescriptionOnShowPage < FeatureTest

  def test_users_task_has_description_info_on_show_page
    # As a guest
    # When I create a new task
    TaskManager.create({title: 'coffee', description: 'is so good'})
    # And I visit it's page
    visit '/tasks/1'
    # Then there is a description of that task
    assert page.has_content?('is so good')
  end

end
