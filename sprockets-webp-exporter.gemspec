lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sprockets/webp/version'

Gem::Specification.new do |spec|
  spec.name = 'sprockets-webp-exporter'
  spec.version = Sprockets::WebP::VERSION
  spec.authors = ['Alex Semyonov', 'Artem Bukhtoiarov']
  spec.email = ['info@r2d2.dev']
  spec.summary = 'Sprockets 4 exporter of PNG and JPEG assets to WebP'
  spec.description = spec.summary
  spec.homepage = 'https://github.com/abuhtoyarov/sprockets-webp-exporter'
  spec.license = 'MIT'

  spec.files = `git ls-files`.split($/)
  spec.test_files = spec.files.grep(%r{^spec/})
  spec.require_paths = ['lib']

  spec.add_dependency 'sprockets'
  spec.add_dependency 'webp-ffi'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
end
