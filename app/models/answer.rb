class Answer < ActiveRecord::Base
  [:text, :question_id].each do |field|
    attr_accessible field
    validates field, :presence => true
  end

  validate :unique_for_question

  belongs_to :question

  has_many :responses, :dependent => :destroy

  def unique_for_question
    if (self.question.answers.any? { |answer| answer.text == self.text})
      self.errors[:unique_for_question] << "not unique"
    end
  end
end