class Api::V1::BookController < ApplicationController
  before_action :set_book, only: [:show]

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: { error: '404 not found' }, status: 404
  end

  def index
    books = Book.all
    render json: books
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end
end
