class ChangeUidInAuthentications < ActiveRecord::Migration
  def up
    change_column :authentications, :uid, :string
  end

  def down
  end
end
