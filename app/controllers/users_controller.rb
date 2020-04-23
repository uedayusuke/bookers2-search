class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:top, :about]

  def top
  end

  def about
  end

  def new
    @book = Book.new #
  end

  def index
    @users = User.all
    @user = User.find(current_user.id)
    @book = Book.new
  end

  def show
  	@user = User.find(params[:id])
    @book = Book.new #
    @books = @user.books
  end

  def edit
     @user = User.find(params[:id])
     if @user != current_user
      redirect_to user_path(current_user)
    end
  end

  def update
  	@user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
    	redirect_to user_path(@user.id)
    else
      flash.now[:alert] = "error"
      render action: :edit
    end
  end

  def search
    @user_or_book = params[:option]
    @how_search = params[:choice]
    if @user_or_book == "1"
      @users = User.search(params[:search], @user_or_book, @how_search)
    else
      @books = Book.search(params[:search], @user_or_book, @how_search)
    end
  end

  private
  	def user_params
  		params.require(:user).permit(:name, :profile_image, :introduction)
  	end
end
