class AddAutorToBook2 < ActiveRecord::Migration[6.1]
  def change
    rename_column :books, :name, :author
  end
end
