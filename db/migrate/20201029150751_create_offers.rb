class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers do |t|
      t.string :name
      t.text :description
      t.references :owner, null: false, index: true

      t.timestamps
    end
    add_foreign_key :offers, :users, column: :owner_id
  end
end
