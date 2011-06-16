Forked from kiskolabs/carpentry to change paths

BardStatic
=========

     _____________________________________
    / BardStatic – handcrafted prototypes \
    \ with ease                           /
     -------------------------------------
          \   ^__^
           \  (oo)\_______
              (__)\       )\/\
                  ||----w |
                  ||     ||


Installation
------------

Add BardStatic to Gemfile:

    gem "bard_static"

Usage
-----

Put your views in app/views/mockups and view them in 
browser at /mockups/path_to_file.

Examples:

| URI Path           | File path                             |
|--------------------|---------------------------------------|
| /mockups           | app/views/mockups/index.html.erb      |
| /mockups/home      | app/views/mockups/home.html.haml      |
| /mockups/posts/new | app/views/mockups/posts/new.html.slim |

All available Rails helpers work nicely. Pure prototyping bliss!


Hooks
-----

BardStatic let's you add a `#before_bard_static` method in 
`ApplicationController`, that will be run before any prototype. You can 
use it, for example, to provide authentication or prevent prototypes 
from being rendered in production.


Gotchas
-------

When rendering a partial, you must specify the full path
(e.g. `mockups/posts/form`) unless the partial is in 
`app/views/mockups/`.
