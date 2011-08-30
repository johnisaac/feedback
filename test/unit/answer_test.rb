require 'test_helper'

class AnswerTest < ActiveSupport::TestCase
  def setup
    @answer = {
      :content => "Content"
    }
  end

  def test_presence_of_content
    answer = Answer.new(@answer.merge({:content => nil}))
    assert answer.invalid?
  end
end
