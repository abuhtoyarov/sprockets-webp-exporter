require 'sprockets/exporters/base'
require 'webp-ffi'

module Sprockets
  module Exporters
    # Generates a `.webp` file using the webp-ffi
    class WebpExporter < Exporters::Base
      def setup
        @webp_target = "#{target}.webp"
        @logger = Logger.new($stderr)
      end

      def skip?(logger)
        if ::File.exist?(@webp_target)
          logger.debug "Skipping #{@webp_target}, already exists"
          true
        else
          logger.info "Writing #{@webp_target}"
          false
        end
      end

      def call
        ::WebP.encode(target, @webp_target, Sprockets::WebP.encode_options)
      rescue ::WebP::EncoderError
        @logger.warn "Skipping #{@webp_target}, converter error"
      end
    end
  end
end
