# == Schema Information
#
# Table name: invite_codes
#
#  id              :integer          not null, primary key
#  code            :integer
#  user_id         :integer
#  max_redemptions :integer
#  created_at      :datetime
#  updated_at      :datetime
#

class InviteCode < ActiveRecord::Base

end
