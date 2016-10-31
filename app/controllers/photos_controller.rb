class PhotosController < ApplicationController
  def index
    @list_of_photos = Photo.all
    render("photos/index.html.erb")
  end

  def new_form
    render("photos/new.html.erb")
  end

  def create_row
    render("photos/create.html.erb")
  end

  def show
    @id = params["id"]
    @source = Photo.find(@id).source
    @caption = Photo.find(@id).caption
    # @caption = Photo.find({ :id => @id }).caption
    render("photos/show.html.erb")
  end


end
