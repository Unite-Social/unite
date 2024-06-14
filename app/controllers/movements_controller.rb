class MovementsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index, :zoom, :edit, :update, :destroy]
  before_action :set_movement, only: [:show, :zoom, :edit, :update, :destroy]

  def index
    @movements = policy_scope(Movement)

    # The `geocoded` scope filters only flats with coordinates

    @markers = @movements.geocoded.map do |m|
      {
        lat: m.latitude,
        lng: m.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {m: m})
      }
    end
  end

  def show
    authorize @movement
    @minutes = format('%02d', @movement.date.min)
    @month = format('%02d', @movement.date.month)
  end

  def zoom
    @movement = Movement.find(params[:id])

    @markers = [{
      lat:  @movement.latitude,
      lng:  @movement.longitude,
      info_window_html: render_to_string(partial: "info_window", locals: {m:  @movement})
      }]


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
    @movement.destroy!
    redirect_to movements_path, notice: 'Movement was successfully destroyed.', status: :see_other
    authorize @movement
  end

  private

  def movement_params
    params.require(:movement).permit(:name, :date, :rewards, :description, :address, :contact)
  end

  def set_movement
    @movement = Movement.find(params[:id])
  end
end
