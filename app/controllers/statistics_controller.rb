class StatisticsController < ApplicationController
  def show
    render json: { visits_count: link.statistics[:visits_count] }
  end
end
