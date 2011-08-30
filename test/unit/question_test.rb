require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  def setup
    @question = {
      :title => "Title",
      :content => "Content"
    }
  end
  
  def test_presence_of_title
    question = Question.new(@question.merge({:title => nil}))
    assert question.invalid?, "Question must have a title field."
  end
  
  def test_presence_of_content
    question = Question.new(@question.merge({:content => nil}))
    assert question.invalid?, "Question must have a content field."
  end
  
  
  def test_question_should_have_answers
    question = Question.create!({:title => "title", :content => "content"})
    answer_one = Answer.create({ :content => "content", :question_id => question.id })
    answer_two = Answer.create({ :content => "content", :question_id => question.id })
    
    assert_equal 2, question.answers.count
  end
end
