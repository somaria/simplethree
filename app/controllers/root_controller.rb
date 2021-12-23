class RootController < ApplicationController
    def about
        render 'about'
    end
    def contact
        render 'contact'
    end
    def index
        @posts = Post.all
        render 'index'
    end

    def api 
        @response = {
            :status => 200,
            :message => "Hi there"
        }
        render json: @response
    end

    def user
        render json: params[:name]
    end

    def add
        @post = Post.new
        @post.title = params[:title]
        @post.description = params[:description]
        @post.save

        @response = {
            :status => 200,
            :message => "Saved successfully"
        }
        @posts = Post.all
        render "index"
    end

    def delete
        @post = Post.find(params[:id])
        @post.destroy
        @posts = Post.all
        render "index"
    end

    def search
        @query = params[:query]
        @posts = Post.where("posts.title LIKE ?", ["%#{@query}%"])
        render "index"
    end

    def update
        @post = Post.find(params[:id])
        @id = params[:id]
        @title = @post.title
        @description = @post.description
        render "update"
    end

    def updateform
        @post = Post.find(params[:id])
        @post.title = params[:title]
        @post.description = params[:description]
        @post.save
        @posts = Post.all
        render "index"
    end
end
