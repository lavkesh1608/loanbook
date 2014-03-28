class CreateBookRequests < ActiveRecord::Migration
  def change
    create_table :book_requests do |t|
      t.integer :book_id
      t.integer :user_id
      t.string :date_of_request
      t.string :estimated_delivery_date
      t.string :status

      t.timestamps
    end
  end
end
