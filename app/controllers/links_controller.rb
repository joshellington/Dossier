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

    add_breadcrumb @link.title, link_path(@link)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @link }
    end
  end

  def search
    search = params[:q]

    @links = Link.where('title LIKE ?', "#{search}")
    pp @links

    add_breadcrumb 'Search results', search_path(search)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @links }
    end
  end

  def category
    @category = params[:category].capitalize
    @links = Link.where(:categories => {:title => @category}).joins(:category)

    add_breadcrumb @category, search_path(@category)

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
    @link.destroy

    respond_to do |format|
      format.html { redirect_to links_url }
      format.json { head :no_content }
    end
  end
end
