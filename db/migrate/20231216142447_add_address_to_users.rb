class AddAddressToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :street_name, :string
    add_column :users, :state, :string
    add_column :users, :city, :string
    add_column :users, :zip_code, :string
  end
end
