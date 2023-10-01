# woopy

> A textual game

### Usage

Prerequisites:

- [Ruby 3.1.2](https://www.ruby-lang.org/en/downloads/) or later.
- [git](https://git-scm.com)

```bash
git clone git@github.com:clovisphere/woopy.git
cd woopy/woopy
./bin/woopy
```

You may choose not to use the [default](./bin/players.csv) file, and in that case, run the app with:

```bash
./bin/woopy path/to/your/file
```

(see [players.csv](./bin/movies.csv) for specifics about the file content).

To run tests:

```bash
rake
```

And finally, to build and install the gem locally:

```bash
gem build woopy.gemspec
gem install woopy-0.0.1.gem
gem list woopy -d              # display info about the gem
gem uninstall woopy            # to uninstall the gem
```
