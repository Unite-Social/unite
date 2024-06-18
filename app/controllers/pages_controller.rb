class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :about ]

  def home
    @movements_per_user = Movement.group(:user_id).count
    @participants_per_movement = Participant.group(:movement_id).count
    @top_movements = Movement.joins(:participants)
                        .group(:id)
                        .order('COUNT(participants.id) DESC')
                        .limit(2)
  end

  def about
  end
end
