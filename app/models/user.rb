class User < ActiveRecord::Base
  attr_accessible :name, :team_id
  validates :name, :presence => true

  belongs_to :team

  [:polls, :responses].each { |field| has_many field }
end