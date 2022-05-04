module ArgsParser
  class Args
    def initialize(options: {}, switches: {})
      args = ARGV

      x = Parser.parse args, options, switches

      @switches = Switches.new(x[1])
      @options = Options.new(x[0])
      @data = x[2]
    end

    attr_reader :switches, :options, :data
  end
end
