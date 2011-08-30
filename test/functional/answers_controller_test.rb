require 'test_helper'

class AnswersControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create a new answer" do
    before_count = Answer.count
    post :create, :answer => { :content => "content"}
    after_count = Answer.count
    assert_response :redirect
    assert_equal before_count + 1, after_count
  end
  
  test "should get edit" do
    get :edit, :id => 298486374
    assert_response :success
  end

  test "should update the record correctly" do
    before_content = Answer.find(298486374)
    put :update, :id => 298486374, :answer => { :content => "New Content"}
    after_content = Answer.find(298486374)
    assert_response :redirect
    assert_equal after_content.content, "New Content" 
  end
  
  
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show, :id => 298486374
    assert_response :success
  end
end
