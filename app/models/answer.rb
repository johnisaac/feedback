class Answer < ActiveRecord::Base
  belongs_to :question
  
  validates_presence_of :content
  validates_presence_of :question_id, :allow_nil => true
  validates_numericality_of :question_id, :allow_nil => true
end
