require_relative "lib/argsparser/version.rb"

Gem::Specification.new do |s|
  s.name        = 'argsparser'
  s.version     = ArgsParser::Version
  s.summary     = 'A gem for parsing command line arguments'
  s.description = s.summary
  s.authors     = ["Matthias Lee"]
  s.email       = 'matthias@matthiasclee.com'
  s.files       = Dir.glob("**/*")
  s.files.delete("argsparser-#{ArgsParser::Version}.gem")
  s.require_paths = ["lib"]
end
