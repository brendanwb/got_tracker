class EpisodesController < ApplicationController
  before_action :set_episode, only: [:show, :edit, :update, :destroy]

  # GET /episodes
  # GET /episodes.json
  def index
    load_episodes
  end

  # POST /episodes
  # POST /episodes.json
  def create
    @episode = Episode.create(episode_params)
    load_and_render_index
  end

  # PATCH/PUT /episodes/1
  # PATCH/PUT /episodes/1.json
  def update
    Episode.where(id: params[:id]).update_all(episode_params.to_h)
    load_and_render_index
  end

  # DELETE /episodes/1
  # DELETE /episodes/1.json
  def destroy
    @episode.destroy
    respond_to do |format|
      format.html { redirect_to episodes_url, notice: 'Episode was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def load_episodes
    @episodes = Episode.all
  end

  def load_and_render_index
    load_episodes
    render :index, change: "episodes"
  end

  def set_episode
    @episode = Episode.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def episode_params
    params.require(:episode).permit(:title, :is_completed)
  end
end
