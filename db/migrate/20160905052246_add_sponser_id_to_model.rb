class AddSponserIdToModel < ActiveRecord::Migration
  def change
    add_column :models, :sponser_id, :string
  end
end
