class AddWidthToUsers < ActiveRecord::Migration
  def change
    add_column :users ,:width, :string
    add_column :users ,:height, :string
    add_column :users ,:marginleft, :string
    add_column :users ,:marginright, :string
  end
end
