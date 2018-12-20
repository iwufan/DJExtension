Pod::Spec.new do |s|
  s.name	= 'DJExtension'
  s.version	= '1.2.3'
  s.summary	= 'Extensions and globalFunctions for swift. Create components with one line of code.'
  s.homepage	= 'https://github.com/iwufan/DJExtension'
  s.license	= 'MIT'
  s.platform	= :ios
  s.swift_version = '4.2'
  s.author 	= {'jiadawei' => 'jiadawei80@126.com'}
  s.ios.deployment_target = '10.0'
  s.source	= {:git => 'https://github.com/iwufan/DJExtension.git', :tag => s.version}
  s.source_files = 'DJExtension/**/*.{swift}'
  s.requires_arc = true
  s.frameworks	= 'UIKit', 'AVFoundation', 'Photos'
  s.dependency 'SnapKit'

end
