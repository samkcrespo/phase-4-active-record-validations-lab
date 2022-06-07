class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: ['Fiction', 'Non-Fiction']}

  validate :clickbait

  CLICKBAIT_WORDS = [/Won't Believe/i, /Secret/i, /Top\d/i, /Guess/i]

  def clickbait
    if CLICKBAIT_WORDS.none? do |bait|
         bait.match title
       end
      errors.add(:title, "Must be clickbait")
    end
  end

end
