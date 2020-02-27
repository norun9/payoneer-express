class CreatePayouts < ActiveRecord::Migration[5.0]
  def change
    create_table :payouts do |t|
      t.string :payment_id
      t.float :amount
      t.text :description
      t.string :response_code
      t.string :response_description
      t.references :payee, index: true, foreign_key: true
      t.references :currency, index: true, foreign_key: true
      
      t.timestamps
    end
  end
end
