class User < ActiveRecord::Base
  [:name, :team_id].each do |field|
    attr_accessible field
    validates field, :presence => true
  end

  belongs_to :team

  [:polls, :responses].each { |field| has_many field }
end