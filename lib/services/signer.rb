# frozen_string_literal: true

module Services
  class Signer
    class << self
      def run(link:)
        return link.signature if link.signed?

        run!(link:)
      end

      def run!(link:)
        if link.invalid? && link.errors[:url].present?
          raise ArgumentError,
                link.errors.full_messages_for(:url).join(", ")
        end

        link.signature = Digest::SHA1.hexdigest(link.url)
      end
    end
  end
end
