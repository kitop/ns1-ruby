# frozen_string_literal: true

module NS1
  module API
    module Jobs

      #
      # Returns the list of all monitoring jobs for the account
      #
      # @return [NS1::Response]
      #
      def jobs()
        perform_request(HTTP_GET, "/v1/monitoring/jobs")
      end

      #
      # Returns details for a specific monitoring jobs based on its id
      #
      # @param [String] job_id the job ID
      #
      # @return [NS1::Response]
      #
      def job(job_id)
        raise NS1::MissingParameter, "job_id cannot be blank" if blank?(job_id)
        perform_request(HTTP_GET, "/v1/monitoring/jobs/#{job_id}")
      end

    end
  end
end
