# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


a = InviteCode.create(:code => 24056, :user_id => 1, :max_redemptions => 100)
b = InviteCode.create(:code => 12345, :user_id => 2, :max_redemptions => 1)
c = InviteCode.create(:code => 10101, :user_id => 2, :max_redemptions => 1)
d = InviteCode.create(:code => 94057, :user_id => 2, :max_redemptions => 1)
e = InviteCode.create(:code => 94057, :user_id => 1, :max_redemptions => 1)
f = InviteCode.create(:code => 88888, :user_id => 3, :max_redemptions => 1)



g = InviteCodeRedemption.create(:invite_code_id => 1, :user_id => 4)
h = InviteCodeRedemption.create(:invite_code_id => 3, :user_id => 5)
i = InviteCodeRedemption.create(:invite_code_id => 4, :user_id => 6)



