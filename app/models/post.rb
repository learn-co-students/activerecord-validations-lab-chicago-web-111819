class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    validate :is_clickbait

    def is_clickbait
        checker = 0
        clickbait_titles = ["Won't Believe", "Secret", "Top ", "Guess"]
        clickbait_titles.each do |clickbait|
            if title == nil
                return
            elsif title.include? clickbait
                checker += 1
            end
        end
        if checker == 0
            errors.add(:title, "must be clickbait-y")
        else
        end
    end
end
