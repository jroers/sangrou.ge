class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :last
      t.string :first
      t.string :email
      t.string :password_digest
      t.integer :phone
      t.string :dob
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.integer :zip
      t.boolean :is_tech?

      t.timestamps null: false
    end
  end
end
