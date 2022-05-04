require_relative "lib/argsparser/version.rb"

Gem::Specification.new do |s|
  s.name        = 'argparse'
  s.version     = ArgsParser::Version
  s.summary     = 'A gem for parsing command line arguments'
  s.description = s.summary
  s.authors     = ["Matthias Lee"]
  s.email       = 'matthias@matthiasclee.com'
  s.files       = Dir.glob("**/*")
  s.files.delete("argparse-#{ArgsParser::Version}.gem")
  s.require_paths = ["lib"]
  s.homepage = "https://github.com/Matthiasclee/ArgParse"
end
