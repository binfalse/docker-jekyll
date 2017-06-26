FROM debian:testing
MAINTAINER martin scharm

# doing all in once to get rid of the useless stuff
RUN apt-get update \
 && apt-get install -y -q --no-install-recommends \
    gcc \
    make \
    libc-dev \
    ruby \
    ruby-dev \
    ruby-execjs \
    ruby-pygments.rb \
    locales \
 && gem install jekyll jekyll-paginate jekyll-sitemap jekyll-minifier \
 && apt-get purge -y -q --autoremove \
    gcc \
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
