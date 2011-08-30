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
    assert question.invalid?
  end
  
  def test_presence_of_content
    question = Question.new(@question.merge({:content => nil}))
    assert question.invalid?
  end
end
