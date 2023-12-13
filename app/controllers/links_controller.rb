class LinksController < ApplicationController
  def show
    Services::StatisticsRecorder.run(link:)

    redirect_to link.url, status: :found, allow_other_host: true
  end

  def create
    link = Link.new(url: params[:url])
    Services::Signer.run(link:)
    link.save

    render json: link.to_json(only: %i[id url signature])
  end
end
