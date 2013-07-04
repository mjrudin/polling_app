class Answer < ActiveRecord::Base
  [:text, :question_id].each do |field|
    attr_accessible field
    validates field, :presence => true
  end

  belongs_to :question

  has_many :responses
end