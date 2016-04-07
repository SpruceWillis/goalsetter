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

require 'rails_helper'

RSpec.describe Goal, type: :model do

  it {should validate_presence_of(:user_id)}
  it {should validate_presence_of(:title)}
  it {should validate_presence_of(:body)}

  it {should belong_to(:user)}

end
