require 'test_helper'

class AnswerTest < ActiveSupport::TestCase
  def setup
    @answer = {
      :content => "Content",
      :question_id => 298486374
    }
  end

  def test_presence_of_content
    answer = Answer.new(@answer.merge({:content => nil}))
    assert answer.invalid?, "Answer must have a content field."
  end
  
  def test_presence_of_question_id
    answer = Answer.new(@answer.merge({:question_id => nil}))
    assert answer.invalid?, "Answer must have a question_id field."
  end
  
  def test_numericality_of_question_id
    answer = Answer.new(@answer.merge({:question_id => "nil"}))
    assert answer.invalid?, "Answer must have a numeric question_id field."
  end
  
  def test_answers_question_id_become_nil_when_the_question_is_deleted
    question = Question.create!({:title => "title", :content => "content"})
    answer_one = Answer.create(@answer.merge(:question_id => question.id))
    answer_two = Answer.create(@answer.merge(:question_id => question.id))
    
    assert_equal answer_one.question_id, question.id
    assert_equal answer_two.question_id, question.id
    
    question.destroy
    
    answer_one = Answer.find(answer_one.id)
    answer_two = Answer.find(answer_two.id)
    
    assert_equal  nil, answer_one.question_id
    assert_equal  nil, answer_two.question_id
    
  end
end
