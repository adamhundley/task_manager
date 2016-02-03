require_relative "../test_helper"

class UserCreatesTaskTest < Minitest::Test
  include Capybara::DSL
  include TestHelpers

  def test_with_valid_attributes
    visit '/'
    click_link("Create New Task")
    fill_in("task[title]", :with => 'FREAKING Test Task')
    fill_in("task[description]", :with => 'This is a Description')
    click_button('Submit')

    assert_equal "/tasks", current_path

    within("#tasks") do
      assert page.has_content?('FREAKING Test Task')
    end
  end

  def test_a_user_can_edit
    create_tasks(1)
    visit '/tasks/1/edit'
    fill_in("task[title]", :with => 'FREAKING Test Task')
    fill_in("task[description]", :with => 'This is a Description')
    click_button('Submit')
    assert_equal "/tasks", current_path

    within("#tasks") do
      assert page.has_content?("FREAKING Test Task")

    end
  end
end
