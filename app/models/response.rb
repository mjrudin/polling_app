class Response < ActiveRecord::Base
  [:user_id, :answer_id].each do |field|
    attr_accessible field
    validates field, :presence => true
  end

  validate :not_the_creator
  validate :hasnt_already_responded
  validate :on_team

  [:user, :answer].each { |field| belongs_to field }


  def not_the_creator
    if self.answer.question.poll.user_id == self.user_id
      self.errors[:not_the_creator] << "creator can't respond"
    end
  end


  def hasnt_already_responded
    already_responded =
      self.answer.question.responses.where(:user_id => self.user_id).any?

    if already_responded
      self.errors[:hasnt_already_responded] << "already responded"
    end
  end

  def on_team
    other_team_id = self.answer.question.poll.user.team_id
    unless other_team_id.nil? || (other_team_id == self.user.team_id)
      self.errors[:on_team] << "not on team"
    end
  end
end
