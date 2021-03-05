class AddBookIdToSection < ActiveRecord::Migration[6.1]
  def change
    add_column :sections, :book_id, :bigint, before: :name
  end
end
