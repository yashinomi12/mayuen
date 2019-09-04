require 'test_helper'

class LessonControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get lesson_index_url
    assert_response :success
  end

end
