#
# Be sure to run `pod lib lint TinyGraphQL.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TinyGraphQL'
  s.version          = '0.0.3'
  s.summary          = 'A lightweight and easy-to-use GraphQL client for Swift'

  s.swift_version = '5.2'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
A lightweight and easy-to-use GraphQL client for Swift
- with 💘 from @GetStream
                       DESC

  s.homepage         = 'https://github.com/GetStream/TinyGraphQL'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'cardoso' => 'matheus@getstream.io' }
  s.source           = { :git => 'https://github.com/GetStream/TinyGraphQL.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/getstream_io'

  s.ios.deployment_target = '11.0'

  s.source_files = 'Sources/TinyGraphQL/**/*'
end
