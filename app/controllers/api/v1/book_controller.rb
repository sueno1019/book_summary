class BookController < ApplicationController
  def index

  end

  private

  def set_book
    @book = Book.find(params[:id])
  end
end
