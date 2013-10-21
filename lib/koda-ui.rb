require 'koda-api/models/document'
require 'koda-ui/hash'

module Koda
  module UI

    class Context
      def initialize(type = '/')
        @type = type
      end

      def document_to_hash(koda_document)
        hash = Koda::UI::Hash.create koda_document.data.dup
        #hash = koda_document.data.dup
        hash.merge({'_meta' => {
                     'type' => koda_document.type,
                     'url' => koda_document.url,
                     'url_name' => koda_document.url_name,
                     'file_name' => koda_document.file_name
                   }})
      end

      def all
        Koda::Document.where(type: @type).map {|document| document_to_hash document}
      end

      def single(name)
        document = Koda::Document.where(uri: File.join(@type, "#{name}.json")).first
        document_to_hash document unless document.nil?
      end

      def method_missing(name, *args, &block)
        Context.new File.join(@type, name.to_s)
      end
    end
    module Helpers
      def model
        Context.new
      end
    end
  end
end