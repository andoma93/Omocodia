#
# Be sure to run `pod lib lint Omocodia.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Omocodia'
  s.version          = '0.1.0'
  s.summary          = 'Omocodia helps to validate and calculate italian fiscal code.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  Omocodia helps to validate and calculate italian fiscal code. Helps to retrieve informations from fiscal code too.
                       DESC

  s.homepage         = 'https://github.com/andoma93/Omocodia'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'andoma93' => 'andoma93@gmail.com' }
  s.source           = { :git => 'https://github.com/andoma93/Omocodia.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/andoma93'

  s.ios.deployment_target = '8.0'
  s.swift_version = '5.2'

  s.source_files = 'Omocodia/Classes/**/*'
  
  # s.resource_bundles = {
  #   'Omocodia' => ['Omocodia/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
