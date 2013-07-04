class Response < ActiveRecord::Base
  [:user_id, :answer_id].each do |field|
    attr_accessible field
    validates field, :presence => true
  end

  validate :not_the_creator
  validate :hasnt_already_responded

  [:user, :answer].each { |field| belongs_to field }


  def not_the_creator
    if self.answer.question.poll.user.id == self.user_id
      self.errors[:not_the_creator] << "creator can't respond"
    end
  end


  def hasnt_already_responded
    already_responded = self.answer.question.answers.map do |answer|
      answer.responses
    end.flatten.any? { |response| response.user_id == self.user_id }

    if already_responded
      self.errors[:hasnt_already_responded] << "already responded"
    end
  end

end