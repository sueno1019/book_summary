class AddAutorToBook < ActiveRecord::Migration[6.1]
  def change
    def change
      rename_column :books, :name, :author
    end
  end
end
