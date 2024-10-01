class CreateCarts < ActiveRecord::Migration[7.2]
  def change
    create_table :carts do |t|
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
