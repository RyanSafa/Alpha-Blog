class UsersController < ApplicationController

def new
    @user = User.new
end

def create
    @user = User.new(user_params)
    if @user.save  
        flash[:notice] = "Welcome to Ruby Blog, #{@user.username}. You have sucessfully signed up"
        redirect_to articles_path
    else
        render "new"
    end
end

def index
    @users = User.paginate(page: params[:page], per_page: 3)


end


def edit
    @user = User.find(params[:id])
end

def update
    @user = User.find(params[:id])
    if @user.update(user_params)
        flash[:notice] = "Your account information was updated"
        redirect_to user_path(@user)
    else
        render 'edit'
    end
end

def show
    @user = User.find(params[:id])
    @articles = @user.articles.paginate(page: params[:page], per_page: 3)
end

private

def user_params
    params.require(:user).permit(:username, :email, :password)
end
    
end