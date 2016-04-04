# == Schema Information
#
# Table name: goals
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  body       :text             not null
#  user_id    :integer          not null
#  public     :boolean          default("false"), not null
#  completed  :boolean          default("false"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Goal < ActiveRecord::Base
  validates :title, :body, :user_id, presence: true
  validates :public, :completed, inclusion: { in: [true, false] }

  belongs_to :user, inverse_of: :goals
end
