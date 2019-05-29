class Image < ApplicationRecord
  has_one :song
  has_one :playlist
end
