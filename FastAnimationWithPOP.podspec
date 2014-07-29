Pod::Spec.new do |s|
  s.name         = "FastAnimationWithPOP"
  s.version      = "0.0.2"
  s.summary      = "A very simplifty animation framework. Powerby Facebook."

  s.description  = <<-DESC
A very simplifty animation framework. Powerby Facebook POP. Use **fast animation** you can add animations without any lines of code.
                   DESC

  s.homepage     = "https://github.com/WilliamZang/FastAnimationWithPOP"
  s.screenshots  = "https://raw.githubusercontent.com/WilliamZang/FastAnimationWithPOP/master/Docs/demo.gif"

  s.license      = { :type => "MIT", :file => "LICENSE" }
  
  s.author             = { "William" => "chengwei.zang.1985@gmail.com" }


  s.platform     = :ios, "6.0"


  s.source       = { :git => "https://github.com/WilliamZang/FastAnimationWithPOP.git", tag: 'v0.0.2' }

  s.source_files  = "FastAnimationWithPop", "FastAnimationWithPop/**/*.{h,m}"
  s.prefix_header_contents = <<-HEADER
                              #import <POP.h>
                              #ifndef IBInspectable
                              #define IBInspectable
                              #endif
                            HEADER
  # s.exclude_files = "Classes/Exclude"

  # s.public_header_files = "Classes/**/*.h"


  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  A list of resources included with the Pod. These are copied into the
  #  target bundle with a build phase script. Anything else will be cleaned.
  #  You can preserve files from being cleaned, please don't preserve
  #  non-essential files like tests, examples and documentation.
  #

  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  # s.framework  = "SomeFramework"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

  s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  s.dependency "pop", "~> 1.0.5"

end
