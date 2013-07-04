class Question < ActiveRecord::Base
  [:text, :poll_id].each do |field|
    attr_accessible field
    validates field, :presence => true
  end

  belongs_to :poll

  has_many :answers
end