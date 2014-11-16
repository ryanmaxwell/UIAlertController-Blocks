Pod::Spec.new do |s|
  s.name         = "UIAlertController+Blocks"
  s.version      = "0.2"
  s.summary      = "Convenience methods for UIAlertController"
  s.homepage     = "https://github.com/ryanmaxwell/UIAlertController-Blocks"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = "Ryan Maxwell"
  s.source       = { :git => "https://github.com/ryanmaxwell/UIAlertController-Blocks.git", :tag => 0.2 }
  s.source_files  = 'UIAlertController+Blocks.{h,m}'
  s.requires_arc = true
end
