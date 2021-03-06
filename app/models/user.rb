class User < ActiveRecord::Base
  attr_accessible :name, :team_id
  validates :name, :presence => true

  belongs_to :team

  has_many :polls, :dependent => :destroy
  has_many :responses, :dependent => :destroy

  def poll_list
    self.polls.map { |poll| poll.title }
  end

  def response_list
    responses = self.responses.includes(:answer)

    responses.map { |response| response.answer.text}
  end
end