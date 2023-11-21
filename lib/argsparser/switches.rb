module ArgsParser
  class Switches
    def initialize(switches)
      @s = switches
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
