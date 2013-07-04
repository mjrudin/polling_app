class Answer < ActiveRecord::Base
  [:text, :question_id].each do |field|
    attr_accessible field
    validates field, :presence => true
  end

  validates :unique_for_question?

  belongs_to :question

  has_many :responses

  def unique_for_question?
    self.question.answers.any? { |answer| answer.text == self.text}
  end
end