class PostsController < ApplicationController
    def index
        @posts = Post.all
    end
    
    def new 
        @post = Post.new
    end
    
    def create
        @post = Post.create(post_params)
        if @post.save
           flash[:success] = "Post has been saved!"
           redirect_to @post
        else
            flash[:alert] = "Halt, you fiend! You need an image to post here!"
            render :new
        end
    end
    
    def show
       @post = Post.find(params[:id]) 
    end
    
    def edit
        @post = Post.find(params[:id])
    end
    
    def update
        @post = Post.find(params[:id])
        @post.update(post_params)
        if @post.save
            flash[:success] = "Post updated hombre"
            redirect_to(post_path(@post))
        else
           flash[:alert] = "No update hombre, try again." 
           render :edit
        end
    end
    
    private
    
    def post_params
       params.require(:post).permit(:caption, :image) 
    end
end
