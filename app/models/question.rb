class Question < ActiveRecord::Base
  has_many :answers, :dependent => :nullify
  
  validates_presence_of :title, :content
end
