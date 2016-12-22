class CacheonUser < ActiveRecord::Migration
  def change
  	add_column :models, :ancestry_depth, :integer, :default => 0
  end
end
