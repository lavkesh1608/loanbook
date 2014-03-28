class AddBookRequestIdToBookResponse < ActiveRecord::Migration
  def change
    add_column :book_responses, :book_request_id, :integer
  end
end
