# == Schema Information
#
# Table name: protfolios
#
#  id         :bigint           not null, primary key
#  content    :text             not null
#  title      :string           not null
#  url        :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_protfolios_on_user_id  (user_id)
#
class Protfolio < ApplicationRecord

  belongs_to :user

end
