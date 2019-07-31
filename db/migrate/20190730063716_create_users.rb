class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
    	t.string :username
    	t.string :fullname
    	t.string :email, index: true, unique: true
    	t.string :password_digest 
    	t.string :activation_digest 
    	t.string :reset_digest
    	t.datetime :reset_sent_at
    	t.string :remember_digest
    	t.boolean :activated, default: false
    	t.datetime :activated_at
    	t.integer :role, default: 0

      t.timestamps
    end
  end
end
