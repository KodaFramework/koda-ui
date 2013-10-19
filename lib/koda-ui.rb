require 'koda-api/models/document'

module Koda
  module UI

    class Context
      def initialize(type = nil)
        @type = type
      end

      def document_to_hash(koda_document)
        hash = koda_document.data.dup
        hash.merge({
          'url' => koda_document.url,
          'url_name' => koda_document.url_name,
          'file_name' => koda_document.file_name
        })
      end

      def all
        Koda::Document.where(type: @type).map {|document| document_to_hash document}
      end

      def single(name)
        document = Koda::Document.where(uri: "#{@type}/#{name}.json").first
        document_to_hash document unless document.nil?
      end

      def method_missing(name, *args, &block)
        Context.new "#{@type}/#{name}"
      end
    end
    module Helpers
      def model
        Context.new
      end
    end
  end
end