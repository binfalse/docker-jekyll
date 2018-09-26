# This file is part of the Docker Image for Jekyll.
# Copyright (C) 2017 Martin Scharm <https://binfalse.de/contact/>
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

FROM debian:testing
MAINTAINER martin scharm

# doing all in once to get rid of the useless stuff
RUN apt-get update \
 && apt-get install -y -q --no-install-recommends \
    gcc \
    g++ \
    make \
    libc-dev \
    ruby \
    ruby-dev \
    ruby-execjs \
    ruby-pygments.rb \
    locales \
 && gem install jekyll jekyll-paginate jekyll-sitemap jekyll-minifier jekyll-seo-tag bundler jekyll-feed jekyll-redirect-from \
 && apt-get purge -y -q --autoremove \
    gcc \
    g++ \
    make \
    libc-dev \
    ruby-dev \
 && apt-get clean \
 && rm -r /var/lib/apt/lists/* /var/cache/*

RUN echo en_US.UTF-8 UTF-8 > /etc/locale.gen && locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

VOLUME ["/jekyll"]
WORKDIR /jekyll

ENTRYPOINT ["/usr/local/bin/jekyll"]
CMD ["build", "--incremental", "--watch"]
