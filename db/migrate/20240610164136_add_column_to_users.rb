class AddColumnToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :name, :string
    add_column :users, :phone, :string
    add_column :users, :cpf, :string
    add_column :users, :organization, :boolean
    add_column :users, :cnpj, :string
    add_column :users, :organization_type, :string
    add_column :users, :description, :string
  end
end
