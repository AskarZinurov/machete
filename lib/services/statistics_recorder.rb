# frozen_string_literal: true

module Services
  class StatisticsRecorder
    class << self
      def run(link:)
        link.with_lock do
          link.increment!(:visits_count)
        end

        link
      end
    end
  end
end
