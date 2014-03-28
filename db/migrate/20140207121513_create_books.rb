class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :tag
      t.string :description
      t.integer :user_id
      t.string :status

      t.timestamps
    end
  end
end
