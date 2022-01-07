# frozen_string_literal: true

categories = %w[Math HTML CSS JavaScript]

categories.each do |category|
  PostCategory.create(name: category)
end
