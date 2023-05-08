class Post < ApplicationRecord
    #All posts have a title
    validates :title, presence: true 
    #Post content is at least 250 characters long
    validates :content, length: {minimum:250}
    #Post summary is a maximum of 250 characters
    validates :summary, length: {maximum:250}
    #Post category is either Fiction or Non-Fiction
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    #Custom validator to the `Post` model that ensures the title is sufficiently clickbait-y
    validate :title_clickbait

    private
    
    def title_clickbait
        unless title.present? && (title.include?("Won't Believe") || title.include?("Secret") || title.match?(/Top\s\d+/) || title.include?("Guess"))
          errors.add(:title, "must be sufficiently clickbait-y")
    end
  end
end
