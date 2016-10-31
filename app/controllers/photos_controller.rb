class PhotosController < ApplicationController
  def index
    @list_of_photos = Photo.all
    render("photos/index.html.erb")
  end

  def show
    @id = params["id"]
    @source = Photo.find(@id).source
    @caption = Photo.find(@id).caption
    # @caption = Photo.find({ :id => @id }).caption
    render("photos/show.html.erb")
  end

  def new_form
    render("photos/new.html.erb")
  end

  def create_row
    @caption = params["the_caption"].to_s
    @source = params["the_source"].to_s
    create = Photo.new
    create.caption = @caption
    create.source = @source
    create.save
    redirect_to("http://localhost:3000/photos")
  end

  def edit_form
    @id = params["id"]
    @source = Photo.find(@id).source
    @caption = Photo.find(@id).caption
    # @caption = Photo.find({ :id => @id }).caption
    render("photos/edit.html.erb")
  end

  def update_row
    @id = params["id"]
    @caption = params["the_caption"].to_s
    @source = params["the_source"].to_s
    update = Photo.find(@id)
    update.caption = @caption
    update.source = @source
    update.save
    render("photos/show.html.erb")
  end

  def destroy
    @id = params["id"]
    Photo.find(@id).destroy
    redirect_to("http://localhost:3000/photos")
  end

end
