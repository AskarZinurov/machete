class StatisticsController < ApplicationController
  def show
    render json: { visits_count: link.visits_count }
  end
end
