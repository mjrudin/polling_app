class Response < ActiveRecord::Base
  [:user_id, :answer_id].each do |field|
    attr_accessible field
    validates field, :presence => true
  end

  validate :hasnt_already_responded?, :not_the_creator?

  [:user, :answer].each { |field| belongs_to field }

  def hasnt_already_responded?
    self.answer.responses.none? {|response| response.user_id == self.user_id}
  end

  def not_the_creator?
    self.answer.question.poll.user.id != user_id
  end
end