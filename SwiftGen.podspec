Pod::Spec.new do |s|

  s.name         = "SwiftGen"
  s.version      = "4.1.0-km2"
  s.summary      = "A collection of Swift tools to generate Swift code for your assets, storyboards, strings, …"

  s.description  = <<-DESC
                   A collection of Swift tools to generate Swift code constants (enums or static lets) for:
                   * image assets,
                   * storyboards,
                   * colors
                   * localized strings
                   * … and more
                   DESC

  s.homepage     = "https://github.com/Keemotion/SwiftGen"
  s.license      = "MIT"
  s.author       = { "Olivier Halligon" => "olivier@halligon.net" }
  s.social_media_url = "https://twitter.com/aligatr"

  s.preserve_paths = '*'
  s.source       = { :http => "https://github.com/Keemotion/SwiftGen/releases/download/#{s.version}/swiftgen-#{s.version}.zip" }

end
