Pod::Spec.new do |s|
  s.name	= 'DJExtension'
  s.version	= '1.0.0'
  s.summary	= 'Extensions, globalMethods and util tool methods for swift.'
  s.homepage	= 'https://github.com/iwufan/DJExtension'
  s.license	= 'MIT'
  s.platform	= :ios
  s.author 	= {'jiadawei' => 'jiadawei80@126.com'}
  s.ios.deployment_target = '8.0'
  s.source	= {:git => 'https://github.com/iwufan/DJExtension.git', :tag => s.version}
  s.source_files = 'DJExtension/**/*.{swift}'
  s.requires_arc = true
  s.frameworks	= 'UIKit'
end
