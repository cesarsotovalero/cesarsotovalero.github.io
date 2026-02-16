# jslint

Simple gem to handle jslint.

In a rails project:

    $ rails g jslint:update_config
    $ vim config/jslint.yml
    $ bundle exec jslint path/to/javascript/file.js

As a standalone script:

    $ jslint --indent=2 --predef='[\"Ajax\"]' ... path/to/javascript/file.js

# Configuration

Config file lives in *config/jslint.yml*, following format is accepted:

    jslint:
      options:
        anon:       true      # true, if the space may be omitted in anonymous function declarations
        bitwise:    true      # true, if bitwise operators should be allowed
        cap:        true      # true, if upper case HTML should be allowed
        continue:   true      # true, if the continuation statement should be tolerated
        css:        true      # true, if CSS workarounds should be tolerated
        debug:      true      # true, if debugger statements should be allowed
        eqeq:       true      # true, if == should be allowed
        es5:        true      # true, if ES5 syntax should be allowed
        evil:       true      # true, if eval should be allowed
        forin:      true      # true, if for in statements need not filter
        fragment:   true      # true, if HTML fragments should be allowed
        newcap:     true      # true, if constructor names capitalization is ignored
        node:       true      # true, if Node.js globals should be predefined
        nomen:      true      # true, if names may have dangling _
        on:         true      # true, if HTML event handlers should be allowed
        plusplus:   true      # true, if increment/decrement should be allowed
        properties: true      # true, if all property names must be declared with /*properties*/
        regexp:     true      # true, if the . should be allowed in regexp literals
        undef:      true      # true, if variables can be declared out of order
        unparam:    true      # true, if unused parameters should be tolerated
        sloppy:     true      # true, if the 'use strict'; pragma is optional
        stupid:     true      # true, if really stupid practices are tolerated
        sub:        true      # true, if all forms of subscript notation are tolerated
        vars:       true      # true, if multiple var statements per function should be allowed
        white:      true      # true, if sloppy whitespace is tolerated
    
        maxlen:     150       # the maximum length of a source line
        indent:     2         # the indentation factor
        maxerr:     50        # the maximum number of errors to allow
        passfail:   true      # true, if the scan should stop on first error
    
        # following are relevant only if undef = false
        browser:    true      # true, if the standard browser globals should be predefined
        rhino:      true      # true, if the Rhino environment globals should be predefined
        windows:    true      # true, if MS Windows-specific globals should be predefined
        widget:     true      # true if the Yahoo Widgets globals should be predefined
        devel:      true      # true, if logging should be allowed (console, alert, etc.)
      predefined:
        - Ajax                # list of predefinied globals

# Copyright

Copyright (c) 2010 Geraud. See LICENSE for details.
