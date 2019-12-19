class CreateEthereums < ActiveRecord::Migration[5.1]
  def change
    create_table :ethereums do |t|
      t.float :ask
      t.float :bid
      t.float :last
      t.timestamps
    end

    add_index  :ethereums, :ask
    add_index  :ethereums, :bid
    add_index  :ethereums, :last
  end
end