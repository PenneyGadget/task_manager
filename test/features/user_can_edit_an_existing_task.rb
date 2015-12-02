require_relative '../test_helper'

class UserCanEditATask < FeatureTest

  def test_user_can_edit_a_task
    TaskManager.create({title: 'programming', description: 'practice it'})
    visit '/tasks'
    assert_equal '/tasks', current_path

    click_link('Edit Task')
    assert_equal '/tasks/1/edit', current_path

    fill_in('task[description]', :with => 'is so fun')
    click_button('submit')

    assert_equal '/tasks/1', current_path
    assert page.has_content?('is so fun')
  end

end
