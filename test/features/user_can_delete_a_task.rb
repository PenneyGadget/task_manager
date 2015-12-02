require_relative '../test_helper'

class UserCanDeleteATask < FeatureTest

  def test_user_can_delete_a_task
    TaskManager.create({title: 'programming', description: 'practice it'})
    visit '/tasks'
    assert_equal '/tasks', current_path
    assert page.has_content?('programming')

    click_button('delete')
    assert_equal '/tasks', current_path
    refute page.has_content?('programming')
  end

end
