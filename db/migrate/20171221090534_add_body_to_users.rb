class AddBodyToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :body, :string
  end
end