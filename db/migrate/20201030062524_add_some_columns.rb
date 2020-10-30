class AddSomeColumns < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :remarks, :text
    add_column :offers, :price, :int
  end
end
