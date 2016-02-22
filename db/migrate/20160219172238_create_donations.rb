class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.string :abo
      t.string :rhb
      t.string :product_code
      t.datetime :collection_date
      t.datetime :expiration_date
      t.integer :heart_rate
      t.string :bp
      t.decimal :hemoglobin
      t.boolean :donation_accepted?
      t.integer :tech_id
      t.references :user, index: true, foreign_key: true
      t.references :organization, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
