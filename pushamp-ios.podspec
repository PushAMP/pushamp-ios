#
# Be sure to run `pod lib lint pushamp-ios.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "pushamp-ios"
  s.version          = "0.1.0"
  s.summary          = "iOS library for PushAMP"
  s.description      = <<-DESC
                       [![PushAMP Cocoapod](https://img.shields.io/cocoapods/v/pushamp-ios.svg)](http://cocoapods.org/?q=pushamp-ios)
                       [![PushAMP Travis](https://img.shields.io/travis/PushAMP/pushamp-ios.svg)](https://travis-ci.org/PushAMP/pushamp-ios)

                        PushAMP supports `Cocoapods` for easy installation.
                        To Install, see our **[documentation »](https://github.com/PushAMP/pushamp-ios/wiki/Install)**

                        **Want to Contribute?**

                        The PushAMP library for iOS is an open source project, and we'd love to see your contributions!
                       DESC
  s.homepage         = "https://github.com/PushAMP/pushamp-ios"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Dmitry Ziltcov" => "dzhiltsov@me.com" }
  s.source           = { :git => "https://github.com/PushAMP/pushamp-ios.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'pushamp-ios' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
