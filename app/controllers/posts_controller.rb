class PostsController < ApplicationController
    #Create
    def new
        #사용자가 데이터를 입력할 화면
        #자동으로 액션 이름과 같은 화면을 불러서 사용자에게 보여줘라.
    end
    
    def login
        
    end
    
    def create
        #입력받은 데이터를 실제 DB저장할 액션.
        @post = Post.new
        @post.title= params[:input_title]
        @post.content= params[:input_content]
        @post.date= params[:input_date]
        @post.save
        redirect_to "/posts/show/#{@post.id}"
    end
    
    #Read
    def index
        #모든 post들을 보여주는 view
        @posts=Post.all

    end
    
    
    def show
        #한 개의 post를 보여주는 view
        @post=Post.find(params[:post_id])
    end
    
    #Delete
    def destroy
        #한 개의 post를 삭제하는 액션
        @post=Post.find(params[:post_id])
        @post.destroy
        redirect_to '/'
    end
    
    #Update
    def edit
        #사용자가 데이터를 입력할 화면
        @post=Post.find(params[:post_id])
        
    end
    
    def update
        #입력받은 데이터를 실제 DB 저장할 액션
        @post=Post.find(params[:post_id])
        #수정할 코드
        @post.title= params[:input_title]
        @post.content= params[:input_content]
        @post.date= params[:input_date]
        @post.save
        redirect_to "/posts/show/#{params[:post_id]}"
    end
end
