class CreatePayees < ActiveRecord::Migration[5.0]
  def change
    create_table :payees do |t|
      t.string :email
      t.string :signed_url
      t.boolean :signed, default: false
      t.float :balance, default: 0.0
      t.references :currency
      t.timestamps
    end

    rename_column(:payees, :signed_url, :sign_up_url)
  end
end
