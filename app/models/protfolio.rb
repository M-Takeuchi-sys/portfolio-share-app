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
  has_one_attached :eyecatch

  validates :title, presence: true
  validates :content, presence: true
  validates :url, presence: true

  belongs_to :user
  has_many :likes, dependent: :destroy

  def display_created_at
    I18n.l(self.created_at, format: :default)
  end

  def like_count
    likes.count
  end
end
