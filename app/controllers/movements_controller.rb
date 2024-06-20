class MovementsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index, :zoom, :edit, :update, :destroy]
  before_action :set_movement, only: [:show, :zoom, :edit, :update, :destroy, :zoom]

  def index
    @movements = policy_scope(Movement)
    # The `geocoded` scope filters only flats with coordinates

    @markers = @movements.geocoded.map do |m|
      {
        lat: m.latitude,
        lng: m.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {m: m}),
        info_window_open: false
      }
    end
  end

  def show
    @minutes = format('%02d', @movement.date.min)
    @month = format('%02d', @movement.date.month)
  end

  def zoom
    @markers = [{
      lat:  @movement.latitude,
      lng:  @movement.longitude,
      info_window_html: render_to_string(partial: "info_window", locals: {m:  @movement}),
      info_window_open: true
      }]
  end

  def new
    @movement = Movement.new
    authorize @movement
  end

  def create
    @movement = Movement.new(movement_params)
    @movement.user = current_user
    authorize @movement
    if @movement.save
      # Data added
      redirect_to movement_path(@movement)
    else
      # Error
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @movement.update(movement_params)
      redirect_to @movement
    else
      render @movement
    end
  end

  def destroy
    @movement.destroy!
    redirect_to movements_path, notice: 'Movement was successfully destroyed.', status: :see_other
  end

  private

  def movement_params
    params.require(:movement).permit(:name, :date, :rewards, :description, :address, :contact, :photo)
  end

  def set_movement
    @movement = Movement.find(params[:id])
    authorize @movement
  end
end
