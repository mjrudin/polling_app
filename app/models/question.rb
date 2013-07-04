class Question < ActiveRecord::Base
  [:text, :poll_id].each do |field|
    attr_accessible field
    validates field, :presence => true
  end

  belongs_to :poll

  has_many :answers

  def add_answer(text)
    Answer.create!(:text => text, :question_id => self.id)
  end

  def results
    response_counts = {}
    answers = self.answers.includes(:responses)

    answers.each do |answer|
      response_counts[answer.text] = answer.responses.length
    end
    response_counts
  end
end