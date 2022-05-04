# ArgParse

A gem for parsing command-line arguments.

## Usage:
```rb
require "argparse"

o = { # options prefixed with --
  asd: { has_argument: false }, # option with no arguments
  qwe: { has_argument: true } # option with arguments
}

s = { # switched prefixed with -
  q: { has_argument: true }, # switch with arguments
  a: { has_argument: false } # switch without arguments
}

x=ArgsParser::Args.new(options: o, switches: s)
```

Running it:
```sh
$ ruby example.rb data --asd --qwe aaa -a -qa "more data"
```

To get args:
```rb
x.switches[:q] # => a
x.switches[:a] # => true
x.options[:asd] # => true
x.options[:qwe] # => aaa

x.data.to_s # => ["data", "more data"]
```
