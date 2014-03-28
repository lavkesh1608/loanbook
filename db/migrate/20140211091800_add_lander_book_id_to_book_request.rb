class AddLanderBookIdToBookRequest < ActiveRecord::Migration
  def change
    add_column :book_requests, :lander_book_id, :integer
  end
end
