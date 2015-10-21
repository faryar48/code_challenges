class InviteCodes < ActiveRecord::Migration
  def change
    create_table :invite_codes do |t|
      t.integer :code
      t.integer :user_id
      t.integer :max_redemptions
      t.timestamps
    end
  end
end
