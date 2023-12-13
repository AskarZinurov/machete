# frozen_string_literal: true

module Services
  class StatisticsCleaner
    class << self
      def run(link:)
        link.transaction do
          link.increment!(:visits_count, Visit.where(link_id: link.id).delete_all)
        end
      end
    end
  end
end
