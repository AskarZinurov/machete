# frozen_string_literal: true

module Services
  class StatisticsRecorder
    class << self
      def run(link:, request:)
        link.visits.create!(agent: request.user_agent.to_json)

        link
      end
    end
  end
end
