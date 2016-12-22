class AddAncestryToModel < ActiveRecord::Migration
  def change
    add_column :models, :ancestry, :string
    add_index :models, :ancestry
  end
end
