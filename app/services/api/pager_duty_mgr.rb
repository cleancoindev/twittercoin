module API
  module PagerDutyMgr
    module Client
      extend self
      def new
        Pagerduty.new ENV["PAGERDUTY"]
      end
    end

    module CriticalBug
      extend self

      def trigger(description, details={})
        @client ||= API::PagerDutyMgr::Client.new
        @client.trigger(description, details) unless Rails.env.development?
      end

    end
  end
end
