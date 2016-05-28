class LyricsController < ApplicationController
  before_action :set_lyric, only: [:show, :edit, :update, :destroy]

  # GET /lyrics
  def index
    @lyrics = Lyric.all
  end

  # GET /lyrics/1
  def show
  end

  # GET /lyrics/new
  def new
    @lyric = Lyric.new
  end

  # GET /lyrics/1/edit
  def edit
  end

  # POST /lyrics
  def create
    @lyric = Lyric.new(lyric_params)

    if @lyric.save
      redirect_to @lyric, notice: 'Lyric was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /lyrics/1
  def update
    if @lyric.update(lyric_params)
      redirect_to @lyric, notice: 'Lyric was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /lyrics/1
  def destroy
    @lyric.destroy
    redirect_to lyrics_url, notice: 'Lyric was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lyric
      @lyric = Lyric.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def lyric_params
      params.require(:lyric).permit(:body)
    end
end
