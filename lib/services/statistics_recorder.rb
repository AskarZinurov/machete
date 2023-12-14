# frozen_string_literal: true

module Services
  class StatisticsRecorder
    class << self
      def run(link:)
        link.increment!(:visits_count)

        link
      end
    end
  end
end
