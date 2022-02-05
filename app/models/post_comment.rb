# frozen_string_literal: true

class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :content, presence: true

  has_ancestry
end
