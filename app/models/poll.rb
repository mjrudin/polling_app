class Poll < ActiveRecord::Base
  [:title, :user_id].each do |field|
    attr_accessible field
    validates field, :presence => true
  end

  belongs_to :user

  has_many :questions, :dependent => :destroy

  def add_question(text)
    Question.create!(:text => text, :poll_id => self.id)
  end
end