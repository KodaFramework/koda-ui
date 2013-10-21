module Koda
  module UI
    class Hash < ::Hash
      def self.create(source_hash)
        destination_hash = Hash.new {|hash, key| "The key '#{key}' was not found in the supplied hash"}
        source_hash.each do |key, value|
          destination_hash[key] = value
        end
        destination_hash
      end

      alias_method :old_getter, :[]

      def [](key)
        if key.to_s.include?('.')
          current_hash = self
          key_parts = key.to_s.split('.')

          while key_parts.length > 0
            current = current_hash[key_parts.shift]
            if current_hash.is_a?(::Hash)
              current_hash = current
            end

            if key_parts.length == 0
              return current
            end
          end

        end
        old_getter key
      end
    end
  end
end