class Post < ActiveRecord::Base
    validates :title, inclusion: { in: ["Won't Believe", "Secret", "Top", "Guess"] }
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] }

    # validates :title, inclusion: { in: ["Won't Believe", "Secret", "Top", "Guess"] }
end

#     def is_clickbait
#         baits = ["Won't Believe", "Secret", "Top", "Guess"]
#         baits.each do |bait|
#             if self.title.include?(bait)
#                 true
#             else 
#                 errors.add(:title, "not clickbait")
#             end
#         end
#     end

# end
