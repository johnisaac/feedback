require 'test_helper'

class AnswersControllerTest < ActionController::TestCase
  test "should get new" do
    get :new, :question_id => 298486374
    assert_response :success
  end

  test "should create a new answer" do
    before_count = Answer.count
    post :create, :question_id => 298486374, :Answer => { :question_id => 298486374, :content => "content"}
    after_count = Answer.count
    assert_response :redirect
    assert_equal before_count + 1, after_count
  end
  
  test "should get edit" do
    get :edit, :question_id => 298486374, :id => 298486374
    assert_response :success
  end

  test "should update the record correctly" do
    before_content = Answer.find(298486374)
    put :update, :question_id => 298486374, :id => 298486374, :Answer => { :question_id => 298486374, :content => "New Content"}
    after_content = Answer.find(298486374)
    assert_response :redirect
    assert_equal after_content.content, "New Content" 
  end
  
  test "should get index" do
    get :index, :question_id => 298486374
    assert_response :success
  end

  test "should get show" do
    get :show, :question_id => 298486374, :id => 298486374
    assert_response :success
  end
end
