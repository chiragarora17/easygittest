class GiftRequestsController < ApplicationController
  before_filter :authenticate_user!
  autocomplete :gift_request, :title, :extra_data => [:description]
  # GET /gift_requests
  # GET /gift_requests.json
  def index
    @gift_requests = GiftRequest.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @gift_requests }
    end
  end

  # GET /gift_requests/1
  # GET /gift_requests/1.json
  def show
    @gift_request = GiftRequest.find(params[:id])
    @gift_request_comments = @gift_request.comments
    @gift_request_likes = @gift_request.likes
    @gift_request_tags = @gift_request.tags
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gift_request }
    end
  end

  # GET /gift_requests/new
  # GET /gift_requests/new.json
  def new
    @gift_request = GiftRequest.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gift_request }
    end
  end

  # GET /gift_requests/1/edit
  def edit
    @gift_request = GiftRequest.find(params[:id])
  end

  # POST /gift_requests
  # POST /gift_requests.json
  def create
    @gift_request = GiftRequest.new(params[:gift_request])

    respond_to do |format|
      if @gift_request.save
        format.html { redirect_to @gift_request, notice: 'Gift request was successfully created.' }
        format.json { render json: @gift_request, status: :created, location: @gift_request }
      else
        format.html { redirect_to '/gift_requests/new', notice: @gift_request.errors.full_messages.to_sentence}
        format.json { render json: @gift_request.errors.full_messages.to_sentence, status: :unprocessable_entity }
      end
    end
  end

  # PUT /gift_requests/1
  # PUT /gift_requests/1.json
  def update
    @gift_request = GiftRequest.find(params[:id])

    respond_to do |format|
      if @gift_request.update_attributes(params[:gift_request])
        format.html { redirect_to @gift_request, notice: 'Gift request was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gift_request.errors.full_messages.to_sentence, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gift_requests/1
  # DELETE /gift_requests/1.json
  def destroy
    @gift_request = GiftRequest.find(params[:id])
    @gift_request.destroy

    respond_to do |format|
      format.html { redirect_to gift_requests_url }
      format.json { head :no_content }
    end
  end
end
