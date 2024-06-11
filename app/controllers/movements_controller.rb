class MovementsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :show, :index]

  def index
    @movement = policy_scope(Movement)
  end

  def show
    authorize @movement
  end

  def new
    @movement = Movement.new
    authorize @movement
  end

  def create
    @movement = Movement.new(movement_params)
    @movement.user = current_user
    @movement.save
    raise
    if @movement.save
      # Data added
      redirect_to movement_path(@movement)
    else
      # Error
      render :new, status: :unprocessable_entity
    end
    authorize @movement
  end

  def edit
    authorize @movement
  end

  def update
    authorize @movement
  end

  def destroy
    authorize @movement
  end

  private

  def movement_params
    params.require(:movement).permit(:name, :date, :rewards, :description, :address, :contact)
  end
end
