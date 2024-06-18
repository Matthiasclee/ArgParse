module ArgsParser
  module Parser
    def self.parse(args, expected_opts, expected_switches)
      @@options = {}
      @@switches = {}
      @@data = []

      read = :new_arg
      rmode = nil
      args.each do |arg|
        if read == :new_arg
          if rmode == :data
            @@data << arg
          elsif arg == "--"
            rmode = :data
          elsif arg.start_with?("--")
            b = arg.sub("--", "").split("=")
            a = b[0].to_sym

            if expected_opts.keys.include?(a)
              if expected_opts[a][:has_argument]
                if b[1]
                  @@options[a] = {arg: b[1]}
                else
                  @@options[a] = {arg: :yes}
                  read = {arg_for_opt: a}
                end
              else
                @@options[a] = {arg: :none}
              end
            end
          elsif arg.start_with?("-")
            b = arg.sub("-", "").split("=")
            a = b[0].split("")

            rmode = :new_switch
            c = 0
            a.each do |x|
              x = x.to_sym
              c = c + 1

              if rmode == :new_switch
                if expected_switches.keys.include?(x)
                  if expected_switches[x][:has_argument]
                    if b[1] && a.length == 1
                      @@switches[x] = {arg: b[1]}
                    else
                      rmode = {arg_for_switch: x}
                      @@switches[x] = {arg: :yes}
                    end
                  else
                    @@switches[x] = {arg: :none}
                  end
                end
              elsif rmode[:arg_for_switch]
                @@switches[rmode[:arg_for_switch]][:arg] = arg[c..arg.length-1]
                rmode = :new_switch
                break
              end
            end

            if rmode.class == Hash
              read = rmode
            end
          else
            @@data << arg
          end
        elsif read[:arg_for_opt]
          @@options[read[:arg_for_opt]][:arg] = arg
          read = :new_arg
        elsif read[:arg_for_switch]
          @@switches[read[:arg_for_switch]][:arg] = arg
          read = :new_arg
        end
      end

      return [@@options, @@switches, @@data]
    end
  end
end
