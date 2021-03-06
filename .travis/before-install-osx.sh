#!/bin/sh

export HOMEBREW_NO_ANALYTICS=1

# brew update
brew unlink python@2
brew install ccache doxygen shtool imagemagick gperf
# python3 -m pip install --upgrade pip
python3 -m pip install --user pyyaml

# according to https://docs.travis-ci.com/user/caching#ccache-cache
export PATH="/usr/local/opt/ccache/libexec:$PATH"

# To get less noise in xcode output, as some builds are terminated for exceeding maximum log length.
gem install xcpretty

cd $TRAVIS_BUILD_DIR
python3 tools/fetch-binary-deps.py
python3 tools/fetch-sclang.py $TRAVIS_HOME/sclang

