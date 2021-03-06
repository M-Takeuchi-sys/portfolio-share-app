# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile, dependent: :destroy
  has_many :protfolios, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :favorite_protfolios, through: :likes, source: :protfolio

  delegate :birthday, :age, :gender, to: :profile, allow_nil: true

  def display_name
    profile&.nickname || self.email.split('@').first #ぼっち演算子profileがnilならemailを表示
  end

  def prepare_profile
    profile || build_profile #profileの値がなければbuild_prrofile
  end

  def avatar_image
    if profile&.avatar&.attached?
      profile.avatar
    else
      'default-avatar.png'
    end
  end

  def has_written?(protfolio)
    protfolios.exists?(id: protfolio.id) #このポートフォリオに同じidがあるか？
  end

  def has_liked?(protfolio)
    likes.exists?(protfolio_id: protfolio.id)
  end
end
