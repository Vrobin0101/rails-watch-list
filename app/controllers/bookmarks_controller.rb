class BookmarksController < ApplicationController
  before_action :set_list, only: %w[new create]
  before_action :set_bookmark, only: %w[destroy]

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to @list
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    redirect_to root_path, status: :see_other
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def set_bookmark
    Bookmark.find(params[:id]).destroy
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
