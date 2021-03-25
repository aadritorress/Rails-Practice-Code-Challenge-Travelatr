class Destination < ApplicationRecord
    has_many :posts 
    has_many :blogger, through: :posts 

    def recent_posts
        self.posts.last(5)
    end

    def featured_post
        # self.posts.max_by do |post|
        #     post.likes
        # end
        self.posts.max_by(&:likes)
    end

    def uniq_bloggers
        self.posts.collect{|post| post.blogger}.uniq 
    end

    def blogger_age_avg
        uniq_bloggers.map {|blogger| blogger.age}.sum / uniq_bloggers.count
    end

    def name_country
        "#{self.name}, #{self.country}"
    end

end
