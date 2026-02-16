###
  (c) 2010 Geraud Boyer
  Adapted from rhino.js from Douglas Crockford  (www.JSLint.com)

  This is the node companion to fulljslint.js.
###
###global JSLINT
###
###jslint rhino: false, node: true, strict: false
###
###global require,util,__filename,process
###

((args) ->
  util = require 'util'
  fs = require 'fs'
  path = require 'path'

  print_syntax = () ->
    util.puts 'Usage: jslint.js [options] file.js'
    process.exit 1

  print_syntax() if args.length is 0

  filename = path.join path.dirname(__filename), 'jslint.js'
  JSLINT = fs.readFileSync(filename).toString 'UTF8'
  eval JSLINT

  # Sensible defaults
  options =
    rhino: no, node: no, passfail: no, bitwise: yes, immed: yes, newcap: yes,
    nomen: yes, onevar: yes, plusplus: yes, regexp: yes, undef: yes, white: yes

  input = null
  input_filename = null
  args.forEach (arg, index) ->

    if arg.match /^--no-(\w+)$/
      options[RegExp.$1] = no
    else if arg.match /^--(\w+)=(\S.*)$/
      options[RegExp.$1] = JSON.parse(RegExp.$2)
    else if arg.match /^--(\w+)$/
      options[RegExp.$1] = yes
    else
      input_filename = arg
      input = fs.readFileSync input_filename
      if not input
        util.puts "jslint: Couldn't open file '#{input_filename}'."
        process.exit 1
      else
        # util.debug('opening input');
        input = input.toString 'UTF8'
    return

  print_syntax() if not input

  if not JSLINT input, options
    JSLINT.errors.forEach (error) ->
      if error
        util.puts "Lint at line #{error.line} character #{error.character}: #{error.reason}"
        util.puts (error.evidence or '').replace /^\s*(\S*(\s+\S+)*)\s*$/, "$1"
        util.puts ''
    process.exit 2
  else
    util.puts "jslint: No problems found in #{input_filename}"
    process.exit 0

  return
) process.argv.slice 2
