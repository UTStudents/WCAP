class AddTaskToUser < ActiveRecord::Migration
  def change
    add_column :users, :task_id, :reference
  end
end
