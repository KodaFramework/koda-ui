require 'koda-api/models/document'
require 'koda-ui/hash'

module Koda
  module UI
    class Query
      def document_to_hash(koda_document)
        hash = Koda::UI::Hash.create koda_document.data.dup
        hash.merge({'_meta' => {
            'type' => koda_document.type,
            'url' => koda_document.url,
            'url_name' => koda_document.url_name,
            'file_name' => koda_document.file_name
        }})
      end

      def query(type)
        Koda::Document.where(type: type).map { |document| document_to_hash document }
      end

      def single(name)
        document = Koda::Document.where(uri: "#{name}.json").first
        document_to_hash document unless document.nil?
      end

      def method_missing(name, *args, &block)
        path = File.join(@type, name.to_s)
        path = path + '/' + args[0] if (args.length > 0)
        Context.new path
      end
    end
  end
end
