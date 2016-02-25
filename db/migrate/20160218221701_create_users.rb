class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :last
      t.string :first
      t.string :email
      t.string :password_digest
      t.string :phone
      t.date :dob
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.integer :zip
      t.boolean :is_tech?
      t.integer :organization_id

      t.timestamps null: false
    end
  end
end
