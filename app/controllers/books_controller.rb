class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    flash[:notice]="You have created book successfully."
    redirect_to books_path
  end

  def index
    @books = Book.all
    @user = current_user
  end

  def show
    @books = Book.find(params[:id])
    @user = @books.user
  end

  def edit
    @books = Book.find(params[:id])
  end

  def update
    @books = Book.find(params[:id])
    @books.update(book_params)
    flash[:notice]="You have updated book successfully."
    redirect_to book_path(@books.id)
  end

  def destroy
    @books = Book.find(params[:id])
    @books.destroy
    redirect_to book_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
