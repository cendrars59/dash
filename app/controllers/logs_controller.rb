class LogsController < ApplicationController


  before_action :find_log, only: [:show,:edit,:update, :destroy]
  before_action :find_log_status, only: [:index,:new,:create,:show,:edit,:update]
  before_action :find_log_added_value, only: [:index,:new,:create,:show,:edit,:update]
  before_action :find_log_stage, only: [:index,:new,:create,:show,:edit,:update]
  before_action :find_log_type, only: [:index,:new,:create,:show,:edit,:update]
  before_action :find_milestone, only: [:index,:new,:create,:show,:edit,:update]

  def index
    @search = Log.search(params[:q])
    @logs = @search.result.includes(:log_stage,:log_status,:log_type,:log_added_value,:milestone)
  end

  def show
  end

  def new
    @log = Log.new
  end

  def create
    @log = Log.new(log_params)
    if @log.save
      redirect_to logs_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @log.update(log_params)
      redirect_to logs_path
    else
      render :edit
    end
  end

  def destroy
    @log.destroy
    redirect_to logs_path
  end

  private

  # Avoid paramters hacking
  def log_params
    params.require(:log).permit(:code,:label,:description,:log_added_value_id,:log_stage_id,:log_status_id,:log_type_id,:milestone_id)
  end

  def find_log
    @log = Log.find(params[:id])
  end

  #gathering objects related to log object

  def find_log_status
    @selectable_status = LogStatus.active
  end

  def find_log_added_value
    @selectable_values = LogAddedValue.active
  end

  def find_log_stage
    @selectable_stages = LogStage.active
  end

  def find_log_type
    @selectable_types = LogType.active
  end

  def find_milestone
    @selectable_milestones = Milestone.active
  end

end
