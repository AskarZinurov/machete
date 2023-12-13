class LinksController < ApplicationController
  def show
    Services::StatisticsRecorder.run(link:)

    redirect_to link.url, status: :found, allow_other_host: true
  end

  def create
    link = Link.new(url: params[:url])
    Services::Signer.run(link:)
    link.save

    render json: link_json(link)
  end

  private

  def link_json(link)
    link.as_json(only: %i[id url])
        .merge("short_url" => link.signature)
  end
end
