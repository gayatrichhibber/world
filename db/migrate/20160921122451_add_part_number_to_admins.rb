class AddPartNumberToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :leave, :string
  end
end
