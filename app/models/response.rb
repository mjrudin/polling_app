class Response < ActiveRecord::Base
  [:user_id, :answer_id].each do |field|
    attr_accessible field
    validates field, :presence => true
  end

  [:user, :answer].each { |field| belongs_to field }
end