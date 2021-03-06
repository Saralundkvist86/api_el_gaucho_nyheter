class Article < ApplicationRecord
  validates_presence_of :title, :lead, :category, :content
  enum category: [:news, :sports, :politics]
  belongs_to :journalist, class_name: "User"
end
