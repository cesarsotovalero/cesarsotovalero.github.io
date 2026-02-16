###
  rhino.js
  2009-09-11
  Copyright (c) 2002 Douglas Crockford  (www.JSLint.com) Rhino Edition

  Converted to CoffeeScript by Geraud Boyer

  This is the Rhino companion to fulljslint.js.

###

###global JSLINT
###
###jslint rhino: true, strict: false
###
#
do (arguments) ->

  print_syntax = () ->
    sys.puts 'Usage: jslint.js [options] file.js'
    quit 1

  print_syntax() if not arguments[0]

  options =
    rhino: no, node: no, passfail: no, strict: no, bitwise: yes, newcap: yes,
    nomen: yes, onevar: yes, plusplus: yes, regexp: yes, undef: yes, white: yes

  input = null
  input_filename = null

  for arg in arguments
    do (arg)->
      if arg.match /^--no-(\w+)$/
        options[RegExp.$1] = no
      else if arg.match /^--(\w+)=(\S.*)$/
        options[RegExp.$1] = JSON.parse RegExp.$2
      else if arg.match /^--(\w+)$/
        options[RegExp.$1] = yes
      else
        input_filename = arg
        input = readFile input_filename
        if not input
          print "jslint: Couldn't open file '#{input_filename}'."
          quit 1
      return

  print_syntax() if not input

  if not JSLINT input, options
    JSLINT.errors.forEach (error) ->
      if error
        print "Lint at line #{error.line} character #{error.character}: #{error.reason}"
        print (error.evidence or '').replace /^\s*(\S*(\s+\S+)*)\s*$/, "$1"
        print ''
    quit 2
  else
    print "jslint: No problems found in #{input_filename}"
    quit 0
