python3 scripts/tag_generator.py; JEKYLL_ENV=production
rbenv global 3.2.2 && eval "$(rbenv init -)" && gem install bundler jekyll && bundle install
RUBYOPT='-W0' bundle exec jekyll serve --watch --incremental future
