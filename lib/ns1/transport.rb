# frozen_string_literal: true

module NS1
  module Transport
    class Error < StandardError; end
    class ResponseParseError < Error; end
  end
end
