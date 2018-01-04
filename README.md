# Docker Image for Jekyll

A Docker image that is able to compile Jekyll-based websites.

## What it does

The [Dockerfile](https://github.com/binfalse/docker-jekyll/blob/master/Dockerfile) compiles into a Docker image that is based on a [Debian image](https://hub.docker.com/_/debian/) plus

* ruby-dev
* pygments
* jekyll including the plugins
    * [jekyll-paginate](https://jekyllrb.com/docs/pagination/)
    * [jekyll-sitemap](https://github.com/jekyll/jekyll-sitemap)
    * [jekyll-minifier](https://github.com/digitalsparky/jekyll-minifier/issues)
    * [jekyll-seo-tag](https://github.com/jekyll/jekyll-seo-tag)

In addition, it has a volume `/jekyll` configured, where your jekyll porject should be mounted.

When run without arguments, the container will call

    jekyll build --incremental --watch

So, it will rebuild the Jekyll website and watch the sources for changes to rebuild incrementally.
Just go to your source files and modify something.
After saving you should immediately see the updates in the `_site` directory (and ultimately in your browser).

Let's assume your Jekyll/Git project is located in `/path/to/project`.
Then you just need to mount that path to `/jekyll` and run a container as follows:

    docker run --rm -v /path/to/project:/jekyll binfalse/jekyll

That would be equivalent to running 

    jekyll build --incremental --watch

in `/path/to/project`.
However, the arguments `build --incremental --watch` are just default arguments.
You can just override it by appending your arguments to the docker-run call.
For example, to run `jekyll build --drafts --quiet` you would execute the following:

    docker run --rm -v /path/to/project:/jekyll binfalse/jekyll build --drafts --quiet


In case of questions and doubts [just contact me](https://binfalse.de/contact/).. :)


## LICENSE

	Docker Image for Jekyll
	Copyright (C) 2009-2017 Martin Scharm <https://binfalse.de/contact/>

	This program is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.

	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with this program.  If not, see <http://www.gnu.org/licenses/>.
