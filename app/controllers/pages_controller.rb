class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @movements_per_user = Movement.group(:user_id).count
    @participants_per_movement = Participant.group(:movement_id).count
  end
end
