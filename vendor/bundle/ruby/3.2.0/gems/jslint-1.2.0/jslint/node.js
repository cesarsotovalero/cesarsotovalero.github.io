/*
  (c) 2010 Geraud Boyer
  Adapted from rhino.js from Douglas Crockford  (www.JSLint.com)

  This is the node companion to fulljslint.js.
*/
/*global JSLINT
*/
/*jslint rhino: false, node: true, strict: false
*/
/*global require,util,__filename,process
*/(function(args) {
  var JSLINT, filename, fs, input, input_filename, options, path, print_syntax, util;
  util = require('util');
  fs = require('fs');
  path = require('path');
  print_syntax = function() {
    util.puts('Usage: jslint.js [options] file.js');
    return process.exit(1);
  };
  if (args.length === 0) {
    print_syntax();
  }
  filename = path.join(path.dirname(__filename), 'jslint.js');
  JSLINT = fs.readFileSync(filename).toString('UTF8');
  eval(JSLINT);
  options = {
    rhino: false,
    node: false,
    passfail: false,
    bitwise: true,
    immed: true,
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
  args.forEach(function(arg, index) {
    if (arg.match(/^--no-(\w+)$/)) {
      options[RegExp.$1] = false;
    } else if (arg.match(/^--(\w+)=(\S.*)$/)) {
      options[RegExp.$1] = JSON.parse(RegExp.$2);
    } else if (arg.match(/^--(\w+)$/)) {
      options[RegExp.$1] = true;
    } else {
      input_filename = arg;
      input = fs.readFileSync(input_filename);
      if (!input) {
        util.puts("jslint: Couldn't open file '" + input_filename + "'.");
        process.exit(1);
      } else {
        input = input.toString('UTF8');
      }
    }
  });
  if (!input) {
    print_syntax();
  }
  if (!JSLINT(input, options)) {
    JSLINT.errors.forEach(function(error) {
      if (error) {
        util.puts("Lint at line " + error.line + " character " + error.character + ": " + error.reason);
        util.puts((error.evidence || '').replace(/^\s*(\S*(\s+\S+)*)\s*$/, "$1"));
        return util.puts('');
      }
    });
    process.exit(2);
  } else {
    util.puts("jslint: No problems found in " + input_filename);
    process.exit(0);
  }
})(process.argv.slice(2));
