class AddAncestryToAdmin < ActiveRecord::Migration
  def change
    add_column :admins, :ancestry, :string
  end
end
