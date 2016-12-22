class AddPartNumbersToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :leaveid, :string
  end
end
