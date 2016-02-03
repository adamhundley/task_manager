require_relative '../test_helper'

class TaskManagerTest < Minitest::Test
  include TestHelpers

  
  def test_can_create_a_task
    create_tasks(1)
    task = task_manager.all.first

    assert task.id
    assert_equal "title", task.title
    assert_equal "some description", task.description
  end

  def test_can_return_all_tasks
    create_tasks(3)
    all = task_manager.all

    assert_equal 3, all.count
    assert_equal Task, all.first.class
  end

  def test_can_find_specific_task_from_id
    create_tasks(3)
    task = task_manager.find(2)

    assert_equal 2, task.id
    assert_equal "title", task.title
    assert_equal "some description", task.description
  end

  def test_can_update_specific_task
    create_tasks(3)

    new_data = {title:         "not title",
                description:  "not some description"}

    task_id = task_manager.all.first.id

    task = task_manager.find(task_id)

    assert_equal "title", task.title
    assert_equal "some description", task.description

    task_manager.update(new_data, task_id)
    task = task_manager.find(task_id)

    assert_equal "not title", task.title
    assert_equal "not some description", task.description
  end

  def test_can_delete_specific_task
    create_tasks(10)
    task_id = task_manager.all.last.id

    assert_equal 10, task_manager.all.count

    task_manager.delete(task_id)

    assert_equal 9, task_manager.all.count
  end
end
