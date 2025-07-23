class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  # if have a restaurant, i can do restaurant.reviews
end
