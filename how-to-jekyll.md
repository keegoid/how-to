# Setup Jekyll with GitHub Pages

1. make sure rbenv is installed and setup from qc with ruby-build-github

    https://github.com/keegoid/qc

1. mkdir project-name
1. cd into project
1. vi Gemfile

    ```ruby
    source 'https://rubygems.org'

    gem 'github-pages', group: :jekyll_plugins
    ```

1. set ruby version for project to match github pages and install github pages dependencies

    ```bash
    rbenv local 2.1.7-github
    which ruby
    ruby -v
    gem install bundler
    bundle install
    ```

1. install jekyll base template

    ```bash
    jekyll new . --force
    ```

1. initialize a git repository with .gitignore

    ```bash
    git init
    vi .gitignore
    ```

    make sure it has the following:

    ```txt
    _site
    assets/vendor
    node_modules
    vendor
    Gemfile.lock
    .jekyll-metadata
    .sass-cache
    ```

1. initial commit

    ```bash
    git add .
    git commit -m 'initial commit'
    ```

1. create GitHub repo (without README.md and LICENSE)

    ```bash
    git remote add origin github_url
    git push -u origin master # add -f if overwriting a README.md or LICENSE file
    ```

1. build the site and create some branches

    ```bash
    bundle exec jekyll build
    git branch gh-pages-base # for tracking changes/updates
    git push -u origin gh-pages-base
    git checkout master
    git checkout -b dev # for making changes, merge to master when everything is working
    ```

1. test the site to make sure it builds and see what it looks like in the browser

    ```bash
    bundle exec jekyll serve -w --profile
    ```

1. make some changes, add some posts

    ```bash
    git push -u origin dev
    ```

1. create a pull request to merge changes back into master and go live

## Updates

bundle update
nvm ls-remote | grep "v4.*" | tail -1 | tr -d ' '
nvm install new_version
nvm alias default new_version
npm build
ncu
npm update

## Notes

Run `bundle update` to update an existing site's gems. Note this won't update the jekyll default site template files. Generate a new base site and check for changed files in git with the gh-pages-base branch created earlier.
