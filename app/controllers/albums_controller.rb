class AlbumsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @albums = Album.paginate :page => params[:page], :per_page => 5, :conditions => ['enabled = ? AND user_id = ?', true, current_user.id]

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @albums }
    end
  end

  def show
    @album = Album.find(params[:id])
    @photo = Photo.new
    @photos = Photo.paginate :page => params[:page], :per_page => 10, :conditions => ["album_id = ?", params[:id]]

    unless @album.enabled
      redirect_to root_path
    end

  end

   def new
    @album = Album.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @album }
    end
  end

  def edit
    @album = Album.find(params[:id])
  end

  def create
    @album = Album.new(params[:album])

    respond_to do |format|
      if @album.save
        format.html { redirect_to(@album, :notice => 'album was successfully created.') }
        format.xml  { render :xml => @album, :status => :created, :location => @album }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @album.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @album = Album.find(params[:id])

    respond_to do |format|
      if @album.update_attributes(params[:album])
        format.html { redirect_to(:action => 'index') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @album.errors, :status => :unprocessable_entity }
      end
    end
  end

  def delete
    @album = Album.find(params[:id])

    respond_to do |format|
      if @album.update_attributes(:enabled => false)
        format.html { redirect_to(:action => 'index') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @album.errors, :status => :unprocessable_entity }
      end
    end
  end

end
