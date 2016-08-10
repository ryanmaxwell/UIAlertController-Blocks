Pod::Spec.new do |s|
  s.name         = "UIAlertController+Blocks"
  s.version      = "0.9.1"
  s.summary      = "Convenience methods for UIAlertController"
  s.homepage     = "https://github.com/ryanmaxwell/UIAlertController-Blocks"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = "Ryan Maxwell"
  s.source       = { :git => "https://github.com/ryanmaxwell/UIAlertController-Blocks.git", :tag => '0.9.1' }
  s.source_files  = 'UIAlertController+Blocks.{h,m}'
  s.requires_arc = true
  s.ios.deployment_target = '6.0' # 6.0 as this is a dependency for RMUniversalAlert
  s.tvos.deployment_target = '9.0'
end
