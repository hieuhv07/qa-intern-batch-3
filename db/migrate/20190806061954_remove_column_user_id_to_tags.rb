class RemoveColumnUserIdToTags < ActiveRecord::Migration[5.2]
  def change
    remove_column :tags, :user_id
  end
end
