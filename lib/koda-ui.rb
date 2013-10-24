require 'koda-ui/query'

module Koda
  module UI
    module Helpers
      def koda
        Query.new
      end
    end
  end
end