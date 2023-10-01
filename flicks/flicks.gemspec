Gem::Specification.new do |spec|
    spec.name                   = "flicks"
    spec.version                = "2.0.0"
    spec.license                = "MIT"
    spec.author                 = "The Pragmatic Studio"
    spec.email                  = "support@pragmaticstudio.com"
    spec.summary                = "A command-line, randomized movie reviewer."
    spec.homepage               = "https://pragmaticstudio.com"
    spec.files                  = Dir["{bin,lib}/**/*"] + %w[README.md]
    spec.executables            = ["flicks"]

    spec.required_ruby_version  = ">= 3.1.2"
end
