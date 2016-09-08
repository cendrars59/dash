class LogsController < ApplicationController


  before_action :find_log, only: [:show,:edit,:update, :destroy]
  before_action :find_log_status_open, only: [:new,:create]
  before_action :find_log_status, only: [:index,:show,:edit,:update]
  before_action :find_log_added_value, only: [:index,:new,:create,:show,:edit,:update]
  before_action :find_log_stage, only: [:index,:new,:create,:show,:edit,:update]
  before_action :find_log_type, only: [:index,:new,:create,:show,:edit,:update]
  before_action :find_milestone, only: [:index,:new,:create,:show,:edit,:update]


  def index

    @search = Log.search(params[:q])
    @logs = @search.result.includes(:log_stage,:log_status,:log_type,:log_added_value,:milestone,:user)

    respond_to do |format|
      format.html
      format.csv {send_data @logs.to_csv, filename: "Logs Selection-#{Date.today}.csv"}
    end

  end


  def show
  end


  def new
    @log = Log.new
  end


  def create
    @log = Log.new(log_params)
    @log.user = current_user
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





  private

  # Avoid paramters hacking
  def log_params
    params.require(:log).permit(:code,:label,:description,:log_added_value_id,:log_stage_id,:log_status_id,:log_type_id,:milestone_id,:expectation,:user_id)
  end



  def find_log
    @log = Log.find(params[:id])
  end

  # Following methods are used to
  # gather objects related to log object

  def find_log_status
    @selectable_status = LogStatus.active
  end


  def find_log_status_open
    @selectable_status = LogStatus.open
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

  def is_owner?
    @log.user.id == current_user.id
  end

  # CTRL-LOGS-0xx: Only the user is allowed to delete an existing
  # if the user wanting to delete the log is not the owner then trigger blocking error

  def destroy
    if is_owner?
      @log.destroy
      redirect_to logs_path
    else
      redirect_to logs_path, flash: { alert: "CTRL-LOGS-0xx: You are not the owner of the current log it can not be deleted by you" }
    end
  end


end
