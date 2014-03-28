class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :not_by
      t.string :not_msg
      t.integer :not_to
      t.string :status
      t.boolean :is_active

      t.timestamps
    end
  end
end
