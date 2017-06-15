class CreateHouseHoldOwnerships < ActiveRecord::Migration[5.1]
  def change
    create_table :house_hold_ownerships do |t|
      t.belongs_to :user, index: true
      t.belongs_to :house_hold, index: true
    end
  end
end
