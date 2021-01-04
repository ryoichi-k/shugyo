class AddGoalMessageToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :goal, :text
    add_column :users, :message, :text
  end
end
