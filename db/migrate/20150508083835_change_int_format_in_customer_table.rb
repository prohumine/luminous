class ChangeIntFormatInCustomerTable < ActiveRecord::Migration
  def up
  	change_column :customers, :phone, :string, :not_null => true
  end

  def down
  	change_column :customers, :phone, :integer
  end
end
