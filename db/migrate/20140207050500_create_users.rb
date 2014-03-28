class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :shipping_address
      t.string :city
      t.string :zip_code
      t.string :password
      t.string :username

      t.timestamps
    end
  end
end
