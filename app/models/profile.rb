# == Schema Information
#
# Table name: profiles
#
#  id           :bigint           not null, primary key
#  birthday     :date
#  gender       :integer
#  introduction :text
#  nickname     :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :bigint           not null
#
# Indexes
#
#  index_profiles_on_user_id  (user_id)
#
class Profile < ApplicationRecord
  enum gender: { male: 0, female: 1, other: 2 }
  belongs_to :user
  has_one_attached :avatar

  def age
    return '不明' unless birthday.present? #誕生日が入力されいない時は不明
    years = Time.zone.now.year - birthday.year #現在の歳から誕生日年を引く
    days = Time.zone.now.yday - birthday.yday #日にちの引き算

    if days < 0
      "#{years - 1}歳"
    else
      "#{years}歳"
    end
  end
end
