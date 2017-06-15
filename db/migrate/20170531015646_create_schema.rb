class CreateSchema < ActiveRecord::Migration[5.1]
  def change
    create_table :house_holds do |t|
      t.string :name, nullable: false, index: true
      t.text :description
      t.string :address
      t.references :master, index: true, nullable: false
      t.timestamps
    end

    create_table :services do |t|
      t.string :name, nullable: false
      t.text :description
      t.string :company
      t.date :due_date, nullable: false
      t.boolean :is_paid, default: false, index: true
      t.references :asignee, index: true
      t.belongs_to :house_hold, index: true
      t.timestamps
    end

    create_table :expenses do |t|
      t.string :name, nullable: false
      t.text :description
      t.string :place
      t.float :amount
      t.date :expense_date, index: true
      t.references :expendable, polymorphic: true, index: true
      t.timestamps
    end

    create_table :house_holds_users do |t|
      t.belongs_to :user, index: true
      t.belongs_to :house_hold, index: true
    end

    add_column :users, :name, :string, nullable: false


  end
end
