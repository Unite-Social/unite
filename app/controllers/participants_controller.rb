class ParticipantsController < ApplicationController
  before_action :set_movement, only: [:create]
  def new

  end

  def create
    @participant = Participant.new(user: current_user, movement: @movement)
    authorize @participant
    if @participant.save
      # Data added
      redirect_to movements_path
    else
      # Error
      redirect_to movement_path(@movement), notice: "Não foi possivel confirmar a sua participação!"
    end
  end

  private

  def set_movement
    @movement = Movement.find(params[:movement_id])
  end
end
