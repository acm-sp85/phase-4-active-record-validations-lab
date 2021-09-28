class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :custom_validation?


    NO_USE = [/Won't Believe/i,/Secret/i,/Top \d/i,/Guess/i]

    def custom_validation?

        if NO_USE.none? {|no_use| no_use.match title}
                errors.add(:title, "must be clickbait")

        end

    end

end
