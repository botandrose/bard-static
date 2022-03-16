Forked from kiskolabs/carpentry to change paths

Bard::Static
=========

     _______________________________________
    / Bard::Static – handcrafted prototypes \
    \ with ease                             /
     ---------------------------------------
          \   ^__^
           \  (oo)\_______
              (__)\       )\/\
                  ||----w |
                  ||     ||


[![CI Status](https://github.com/botandrose/bard-static/workflows/CI/badge.svg?branch=master)](https://github.com/botandrose/bard-static/actions?query=workflow%3ACI+branch%3Amaster)
[![Code Climate](https://codeclimate.com/github/botandrose/bard-static/badges/gpa.svg)](https://codeclimate.com/github/botandrose/bard-static)

Installation
------------

Add BardStatic to Gemfile:

    gem "bard-static"

Usage
-----

Two view directories are exposed: static and mockups.

Static: pages in this view path are intended for production,
and are rendered with the application layout.

| URI Path           | File path                             |
|--------------------|---------------------------------------|
| /                  | app/views/static/index.html.erb       |
| /home              | app/views/static/home.html.haml       |
| /posts/new         | app/views/static/posts/new.html.slim  |

Mockups: pages in this view path are intended for prototyping,
and are rendered with no layout at all. However, you can use the
`layout` block helper in the template to render within a layout,
if you like.

| URI Path           | File path                             |
|--------------------|---------------------------------------|
| /mockups           | app/views/mockups/index.html.erb      |
| /mockups/home      | app/views/mockups/home.html.haml      |
| /mockups/posts/new | app/views/mockups/posts/new.html.slim |

All available Rails helpers work nicely. Pure prototyping bliss!

Helpers
-------

`mockup_form_for`: create a dummy form using rails form helpers
`link_to_current`: adds a `current` class if the current url matches the link
`link_to_nav`: same as `link_to_current` but also matches if the current url is a child of the link

Gotchas
-------

When rendering a partial, you must specify the full path
(e.g. `mockups/posts/form`) unless the partial is in 
`app/views/mockups/`.

