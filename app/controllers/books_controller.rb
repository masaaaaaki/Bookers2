class BooksController < ApplicationController
before_action :authenticate_user!
before_action :corrent_user, only: [:edit, :update]


  def top

  end

  def show
  	@book = Book.find(params[:id])
    @emptybook = Book.new
  end

  def index
    @user = current_user
  	@books = Book.all
  	@book = Book.new
  end

  def new
  	@book = Book.new
  end

  def create
  	@book = Book.new(book_params)
  	@book.user_id = current_user.id
  	if @book.save
	  	redirect_to book_path(@book), notice: "Book was successfully created."
    else
      @books = Book.all
      @user = current_user
      render :index
    end
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
  	book = Book.find(params[:id])
  	if book.update(book_params)
  		redirect_to book_path(book), notice: "Book was successfully updated."
  	else
      @book = book
  		@books = Book.all
      @user = current_user
      render :index
  	end
  end

  def destroy
  	@book = Book.find(params[:id])
  	@book.destroy
  	redirect_to books_path, notice: "Book was successfully deleted."

  end

  private
	  def book_params
	  	params.require(:book).permit(:title, :body)
	  end

    def corrent_user
      @book = Book.find(params[:id])
      if current_user != @book.user
        redirect_to books_path
      end
    end



end
