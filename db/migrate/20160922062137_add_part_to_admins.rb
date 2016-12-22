class AddPartToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :total_salary, :string
  end
end
