# frozen_string_literal: true

module Services
  class StatisticsRecorder
    class << self
      def run(link:, request:)
        link.visits.create!(agent: request_data(request))

        link
      end

      private

      def request_data(request)
        { request_id: request.uuid, user_agent: request.user_agent, remote_ip: request.remote_ip }
      end
    end
  end
end
