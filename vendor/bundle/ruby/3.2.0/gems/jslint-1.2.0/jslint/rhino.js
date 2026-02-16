/*
  rhino.js
  2009-09-11
  Copyright (c) 2002 Douglas Crockford  (www.JSLint.com) Rhino Edition

  Converted to CoffeeScript by Geraud Boyer

  This is the Rhino companion to fulljslint.js.

*/
/*global JSLINT
*/
/*jslint rhino: true, strict: false
*/(function(arguments) {
  var arg, input, input_filename, options, print_syntax, _fn, _i, _len;
  print_syntax = function() {
    sys.puts('Usage: jslint.js [options] file.js');
    return quit(1);
  };
  if (!arguments[0]) {
    print_syntax();
  }
  options = {
    rhino: false,
    node: false,
    passfail: false,
    strict: false,
    bitwise: true,
    newcap: true,
    nomen: true,
    onevar: true,
    plusplus: true,
    regexp: true,
    undef: true,
    white: true
  };
  input = null;
  input_filename = null;
  _fn = function(arg) {
    if (arg.match(/^--no-(\w+)$/)) {
      options[RegExp.$1] = false;
    } else if (arg.match(/^--(\w+)=(\S.*)$/)) {
      options[RegExp.$1] = JSON.parse(RegExp.$2);
    } else if (arg.match(/^--(\w+)$/)) {
      options[RegExp.$1] = true;
    } else {
      input_filename = arg;
      input = readFile(input_filename);
      if (!input) {
        print("jslint: Couldn't open file '" + input_filename + "'.");
        quit(1);
      }
    }
  };
  for (_i = 0, _len = arguments.length; _i < _len; _i++) {
    arg = arguments[_i];
    _fn(arg);
  }
  if (!input) {
    print_syntax();
  }
  if (!JSLINT(input, options)) {
    JSLINT.errors.forEach(function(error) {
      if (error) {
        print("Lint at line " + error.line + " character " + error.character + ": " + error.reason);
        print((error.evidence || '').replace(/^\s*(\S*(\s+\S+)*)\s*$/, "$1"));
        return print('');
      }
    });
    return quit(2);
  } else {
    print("jslint: No problems found in " + input_filename);
    return quit(0);
  }
})(arguments);