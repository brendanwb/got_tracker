class EpisodesController < ApplicationController
  before_action :require_login

  # GET /episodes
  # GET /episodes.json
  def index
    load_episodes
    @tracker = Tracker.new({ episodes: @episodes, new_episodes_start_date: "2019/04/14".to_date })
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

  private
  # Use callbacks to share common setup or constraints between actions.
  def load_episodes
    @episodes = Episode.all.order(title: :asc)
  end

  def load_and_render_index
    load_episodes
    @tracker = Tracker.new({ episodes: @episodes, new_episodes_start_date: "2019/04/14".to_date })
    render :index
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def episode_params
    params.require(:episode).permit(:title, :is_completed)
  end
end
