class AddAmountToServices < ActiveRecord::Migration[5.1]
  def change
    add_column :services, :amount, :float
  end
end
