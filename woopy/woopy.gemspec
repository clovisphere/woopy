Gem::Specification.new do |spec|
    spec.name                   = "woopy"
    spec.version                = "0.0.1"
    spec.license                = "MIT"
    spec.author                 = "Clovis Mugaruka"
    spec.email                  = "clovis.mugaruka@gmail.com"
    spec.summary                = "A textual game 😻"
    spec.homepage               = "https://clovisphere.com"
    spec.files                  = Dir["{bin,lib}/**/*"] + %w[README.md]
    spec.executables            = ["woopy"]

    spec.required_ruby_version  = ">= 3.1.2"
end
