class CreateBitcoins < ActiveRecord::Migration[5.1]
  def change
    create_table :bitcoins do |t|
      t.float :ask
      t.float :bid
      t.float :last
      t.timestamps
    end

    add_index  :bitcoins, :ask
    add_index  :bitcoins, :bid
    add_index  :bitcoins, :last
  end
end