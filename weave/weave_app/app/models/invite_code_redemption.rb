# == Schema Information
#
# Table name: invite_code_redemptions
#
#  id             :integer          not null, primary key
#  invite_code_id :integer
#  user_id        :integer
#  created_at     :datetime
#  updated_at     :datetime
#

class InviteCodeRedemption < ActiveRecord::Base

end
