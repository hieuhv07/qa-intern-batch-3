class AddForeignKeyUserToTag < ActiveRecord::Migration[5.2]
  def change
    add_reference :tags, :user, index: true, foreign_key: true
  end
end
