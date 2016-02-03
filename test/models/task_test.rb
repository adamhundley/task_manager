require_relative '../test_helper'

class TaskTest < Minitest::Test
  def test_task_instantiates
    data = {"title"       => "title",
            "id"          => 1,
            "description" => "this is a description"}

    task = Task.new(data)

    assert task.instance_of?(Task)
  end

  def test_assigns_attributes_correctly
    data = {"title"       => "title",
            "id"          => 1,
            "description" => "this is a description"}

    task = Task.new(data)

    assert_equal "title", task.title
    assert_equal "this is a description", task.description
    assert_equal 1, task.id
  end

end
