class AddDetailToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :present_id, :string
    add_column :admins, :From_date, :string
    add_column :admins, :todate, :string
    add_column :admins, :number_of_days, :string
  end
end
