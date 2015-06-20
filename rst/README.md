developer.rackspace.com: docs section
======================================

This system uses the python sphinx tool for structure & building as part of the
static build process. Included is a Makefile & make.bat file for cross platform
building (for development/contribution).

Layout:

* **_static**: static assets unique to the documentation; this may include js,
  css, images, etc.
* **_templates**: custom html templates
* **conf.py**: Configuration, no touchy.
* **index.rst**: Main index / landing page for the docs
* **make.bat**: windows build script
* **Makefile**: linux/osx build

You will need [Sphinx](http://sphinx-doc.org/) installed to build - however to
contribute, all you need is a basic understanding of the project layout and
Restructured Text. [Here is an excellent ReST primer](http://sphinx-doc.org/rest.html).

Once you're all set up: in order to build run:

```
make html
```

You will see the build output and the static files will be dropped in:

```
_build/html
```

On OS/X you can run:

```
open _build/html/index.html
```

To pop open the doc index and preview.



