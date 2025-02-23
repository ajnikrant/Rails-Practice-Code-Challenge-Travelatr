class PostsController < ApplicationController
    def index
        @posts = Post.all
    end

    def show
        @post = Post.find(params[:id])
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])

        if @post.valid?
            @post.update(post_params)
            @post.save
            redirect_to post_path(@post)
        else
            flash[:errors]=@post.errors.full_messages
            render :edit
        end
    end

    private

    def post_params
        params.require(:post).permit(:title, :content, :likes)
    end
end