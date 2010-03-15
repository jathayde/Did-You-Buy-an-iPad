class CreatePurchases < ActiveRecord::Migration
  def self.up
    create_table :purchases do |t|
      t.string :email
      t.boolean :buy
      t.text :why
      t.integer :zip, :limit => 5
      t.timestamps
    end
  end

  def self.down
    drop_table :purchases
  end
end
