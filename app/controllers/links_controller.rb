class LinksController < ApplicationController
  add_breadcrumb "Home", :root_path

  # GET /links
  # GET /links.json
  def index
    @links = Link.order('created_at DESC').paginate(:page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @links }
    end
  end

  # GET /links/1
  # GET /links/1.json
  def show
    @link = Link.find(params[:id])
    @commentable = @link
    @comments = @commentable.comments
    @comment = Comment.new

    add_breadcrumb @link.title, link_path(@link)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @link }
    end
  end

  def search
    query = params[:q].to_s

    if query
      @links = Link.search(query).paginate(:page => params[:page])
    end

    add_breadcrumb "Search results for '#{query}'", root_path

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @links }
    end
  end

  def category
    @category = params[:category].capitalize
    @links = Link.order('created_at DESC').where(:categories => {:title => @category}).joins(:category).paginate(:page => params[:page])

    add_breadcrumb @category, category_path(@category)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @links }
    end
  end

  # GET /links/new
  # GET /links/new.json
  def new
    @link = Link.new
    @query_url = params[:url]
    @query_title = params[:title]

    add_breadcrumb "New Link", new_link_path(@link)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @link }
    end
  end

  # GET /links/1/edit
  def edit
    @link = Link.find(params[:id])

    add_breadcrumb "Edit Link", edit_link_path(@link)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @link }
    end
  end

  def vote
    @link = Link.find(params[:id])
    @link.vote params[:type]
    @link.save

    respond_to do |format|
      format.html  { render json: @link.vote_count, content_type: 'application/json' }
    end
  end

  def click
    @link = Link.find(params[:id])
    @link.click
    @link.save

    respond_to do |format|
      format.json { render json: @link }
    end
  end

  def fetch
    biff = Biffbot::Base.new(APP_CONFIG["diffbot"])
    @res = biff.parse params[:url], {:summary => false, :comments => false}

    respond_to do |format|
      format.json { render json: @res }
    end
  end

  # POST /links
  # POST /links.json
  def create
    @link = Link.new(params[:link])

    respond_to do |format|
      if @link.save
        format.html { redirect_to @link, notice: 'Link was successfully created.' }
        format.json { render json: @link, status: :created, location: @link }
      else
        format.html { render action: "new", notice: 'Sorry, that entry is a duplicate.' }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /links/1
  # PUT /links/1.json
  def update
    @link = Link.find(params[:id])

    respond_to do |format|
      if @link.update_attributes(params[:link])
        format.html { redirect_to @link, notice: 'Link was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /links/1
  # DELETE /links/1.json
  def destroy
    @link = Link.find(params[:id])
    if current_user == @link.user
      @link.destroy
    end

    respond_to do |format|
      format.html { redirect_to links_url }
      format.json { head :no_content }
    end
  end
end
