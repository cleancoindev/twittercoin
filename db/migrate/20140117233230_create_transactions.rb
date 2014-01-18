class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.references :tweet_tip, null: false
      t.integer :satoshis, null: false
      t.string :tx_hash, null: false
    end
  end
end
