class InviteCodeRedemptions < ActiveRecord::Migration
  def change
    create_table :invite_code_redemptions do |t|
      t.integer :invite_code_id
      t.integer :user_id
      t.timestamps
    end
  end
end
