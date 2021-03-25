class Blogger < ApplicationRecord
    has_many :posts 
    has_many :destinations, through: :posts 

    validates :name, uniqueness: true 
    validates :age, numericality: { greater_than: 0}
    validates :bio, length: { minimum: 30}

    def likes 
        self.posts.count do |post|
            post.likes
        end 
    end 

    # def most_likes
    #     likes.sort_by
    # end 

end
