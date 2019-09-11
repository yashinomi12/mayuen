class Post < ApplicationRecord
  validates :title, {presence: true, length: {maximum: 60}}
  validates :content, {presence: true}
end
