class AddAmountToStuffs < ActiveRecord::Migration
  def change
    add_column :stuffs, :amount, :integer, default: 0 
  end
end
