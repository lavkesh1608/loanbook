class CreateBookResponses < ActiveRecord::Migration
  def change
    create_table :book_responses do |t|
      t.integer :book_id
      t.integer :user_id
      t.string :return_date
      t.string :delivered_date
      t.string :status
      t.integer :borrower_user_id

      t.timestamps
    end
  end
end
