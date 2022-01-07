# frozen_string_literal: true

class Post < ApplicationRecord
  validates :name, presence: true
  validates :body, presence: true

  belongs_to :post_category
  belongs_to :creator, class_name: 'User'
end
