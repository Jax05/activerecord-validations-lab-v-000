class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :clickbait_title

  def clickbait_title
    clickbait = ["Won't Believe", "Secret", "Top [number]", "Guess"]

    unless clickbait.any? { |clickbait| title.include?(clickbait) }
      errors.add(:title, 'must include clickbait')
    end
  end
end
