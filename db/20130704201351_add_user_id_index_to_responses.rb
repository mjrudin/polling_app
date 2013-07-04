class AddUserIdIndexToResponses < ActiveRecord::Migration
  def change
    add_index :responses, :user_id
  end
end
