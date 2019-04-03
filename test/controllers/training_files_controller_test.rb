require 'test_helper'

class TrainingFilesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get training_files_index_url
    assert_response :success
  end

  test "should get new" do
    get training_files_new_url
    assert_response :success
  end

end
