class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :clickbait_title

  def clickbait_title
    clickbait = ["Won't Believe", "Secret", "Top [number]", "Guess"]

    clickbait.any? { |clickbait| title.include?(clickbait) }
  end
end
