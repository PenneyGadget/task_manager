require_relative '../test_helper'

class TaskManagerTest < Minitest::Test

  # def create_tasks(num)
  #   num.times do |n|
  #     TaskManager.create(:title => "a title#{n+1}", :description => "a description#{n+1}")
  #   end
  # end

  def test_task_can_be_created
    TaskManager.create({ title: "traffic spy is amazing",
                         description: "jk"})

    task = TaskManager.find(1)

    assert_equal "traffic spy is amazing", task.title
    assert_equal "jk", task.description
    assert_equal 1, task.id
  end

  def test_all_method_collects_all_our_tasks
    TaskManager.create({title: "coffee", description: "is so good"})
    TaskManager.create({title: "wine", description: "is even better"})
    TaskManager.create({title: "martinis", description: "i love them"})

    tasks = TaskManager.all
    task1 = tasks[0]
    task2 = tasks[1]
    task3 = tasks[2]

    assert_equal 3, tasks.length
    assert_equal "coffee", task1.title
    assert_equal 2, task2.id
    assert_equal "i love them", task3.description
  end

  def test_find_method_finds_our_task_objects_and_their_details
    TaskManager.create({title: "coffee", description: "is so good"})
    TaskManager.create({title: "wine", description: "is even better"})
    TaskManager.create({title: "martinis", description: "i love them"})

    task1 = TaskManager.find(2)

    assert_equal "wine", task1.title
    assert_equal 2, task1.id
    assert_equal Task, TaskManager.find(1).class
  end

  def test_update_method_updates_correctly
    TaskManager.create({title: "martinis", description: "i love them"})

    TaskManager.update(1, {title: "martinis", description: "i REALLY love them"})
    updated = TaskManager.find(1)

    assert_equal "i REALLY love them", updated.description
  end

  def test_delete_method_deletes_a_task_and_others_remain
    TaskManager.create({title: "coffee", description: "is so good"})
    TaskManager.create({title: "wine", description: "is even better"})
    TaskManager.create({title: "martinis", description: "i love them"})

    tasks_before = TaskManager.all
    assert_equal 3, tasks_before.length

    TaskManager.delete(2)
    tasks_after = TaskManager.all

    assert_equal 2, tasks_after.length
    refute tasks_after.any? { |task| task.id == 2 }
    assert tasks_after.none? { |task| task.title == "wine" }
  end

end
