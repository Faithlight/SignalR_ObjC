#
# Be sure to run `pod lib lint SignalR_ObjC.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SignalR_ObjC'
  s.version          = '0.1.2'
  s.summary          = 'SignalR-ObjC fork'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
                     fork with SignalR-ObjC
                       DESC

  s.homepage         = 'https://github.com/Faithlight/SignalR_ObjC'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Faithlight' => '454277536@qq.com' }
  s.source           = { :git => 'https://github.com/Faithlight/SignalR_ObjC.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.source_files = 'SignalR_ObjC/SignalR/**/*'
  
  # s.resource_bundles = {
  #   'SignalR_ObjC' => ['SignalR_ObjC/Assets/*.png']
  # }

  s.public_header_files = 'Pod/SignalR/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'AFNetworking'
  s.dependency 'SocketRocket'
end
