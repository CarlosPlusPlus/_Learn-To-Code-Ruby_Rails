# == Schema Information
#
# Table name: genres
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  song_id    :integer
#

require 'test_helper'

class GenreTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
