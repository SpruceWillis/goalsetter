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

FactoryGirl.define do
  factory :goal do

    title { Faker::Lorem.word }
    body { Faker::Lorem.paragraphs(paragraph_count = 1 + rand(10))}
    user_id { User.limit(1).order("RANDOM()").first.id }
    public {[true, false].sample}
    completed {[true, false].sample}
  end
end
