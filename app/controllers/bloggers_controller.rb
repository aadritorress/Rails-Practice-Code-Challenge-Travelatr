class BloggersController < ApplicationController

def new 
    @blogger = Blogger.new
end 

def create 
    @blogger = Blogger.create(blogger_params)
    redirect_to @blogger
end

def show 
    @blogger = Blogger.find_by(id: params[:id])
end 

private

def blogger_params 
params.require(:blogger).permit(:name, :bio, :age)
end 



end
