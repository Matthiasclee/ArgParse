module ArgsParser
  class Options
    def initialize(options)
      @s = options
    end

    def [](a)
      if @s[a.to_sym]
        if @s[a.to_sym][:arg] == :none
          return true
        else
          return @s[a.to_sym][:arg]
        end
      else
        return nil
      end
    end
  end
end
