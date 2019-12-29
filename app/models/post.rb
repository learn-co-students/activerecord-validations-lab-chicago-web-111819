class Post < ActiveRecord::Base
    # Enforcing custom validator
    validate :title_must_be_clickbaity

    validates :title, { :presence => true }
    validates :content, { length: { :minimum => 250 } }
    validates :summary, { length: { :maximum => 250 } }
    validates :category, { inclusion: { in: %w(Fiction Non-Fiction) } }
 
    # Custom validator
    def title_must_be_clickbaity
        expected_present = [ /Won't Believe/i, /Secret/i, /Top [0-9]+/i, /Guess/i ]

        if expected_present.none? { |w| w.match(title) }
            errors.add(:title, "isn't clickbait-y.")
        end
    end

end
