#
# Be sure to run `pod lib lint Handy.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Handy'
  s.version          = '0.1.3'
  s.summary          = 'Extensions for Swift.'

  s.description      = 'Convenience initializers & other extensions.'

  s.homepage         = 'https://github.com/bumpersfm/handy'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Dani Postigo' => 'dani.postigo@gmail.com' }
  s.source           = { :git => 'https://github.com/bumpersfm/handy.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/alsoyay'

  s.ios.deployment_target = '9.0'

  s.source_files = 'Handy/**/*'
  s.exclude_files = 'Handy/UIKit-Extensions.swift'
  
  # s.resource_bundles = {
  #   'Handy' => ['Handy/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'Foundation'
  # s.dependency 'AFNetworking', '~> 2.3'
end
