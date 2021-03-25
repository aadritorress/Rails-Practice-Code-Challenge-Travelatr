class Post < ApplicationRecord
    belongs_to :blogger 
    belongs_to :destination  

    after_initialize :set_likes, unless: :persisted?

    validates :content, length: { minimum: 100}

 def set_likes
    self.likes = 0 
 end 

 def add_like
    self.likes += 1
 end


end
