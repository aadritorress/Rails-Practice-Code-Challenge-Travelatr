class PostsController < ApplicationController

def new
    @post = Post.new
end 

def create
    @post = Post.create(post_params)
    redirect_to post_path(@post)
end 

def show
    @post = Post.find_by(id: params[:id])
end 

def edit
    @post = Post.find_by(id: params[:id])
end 

def update
    @post = Post.find_by(id: params[:id])
    @post.update(post_params)
    redirect_to post_path(@post)
end 

private

def add_like
    @post = Post.find(params[:id])
    @post.add_like
    @post.save
    redirect_to @post
end

def post_params
    params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
end 

end
