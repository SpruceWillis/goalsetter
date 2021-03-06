# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  body             :string           not null
#  user_id          :integer          not null
#  commentable_id   :integer          not null
#  commentable_type :string           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Comment < ActiveRecord::Base
  validates :body, :commentable_id, :commentable_type, presence: true

  belongs_to :commentable, polymorphic: true
end
