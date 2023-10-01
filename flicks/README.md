# flicks

> A command-line, randomized movie reviewer

### Usage

Prerequisites:

- [Ruby 3.1.2](https://www.ruby-lang.org/en/downloads/) or later.
- [git](https://git-scm.com)

```bash
git clone git@github.com:clovisphere/woopy.git
cd woopy/flicks
./bin/flicks                # uses the default input file, ie. movies.csv
```

You may choose not to use the [default](./bin/movies.csv) file, and in that case, run the app with:

```bash
./bin/flicks path/to/your/file
```

(see [movies.csv](./bin/movies.csv) for specifics about the file content).

To run the tests:

```bash
rake
```

And finally, to build and install the [gem](./flicks.gemspec) locally:

```bash
gem build flicks.gemspec
gem install flicks-2.0.0.gem
gem list flicks -d             # display info about the gem
gem uninstall flicks           # to uninstall the gem
```
