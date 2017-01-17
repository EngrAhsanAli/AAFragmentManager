
Pod::Spec.new do |s|
s.name             = 'AAFragmentManager'
s.version          = '0.1.0'
s.summary          = 'AAFragmentManager is a child view manager responsible to add child subviews in UIView and easy switching between them, written in Swift.'

s.description      = <<-DESC
AAFragmentManager is a child view manager responsible to add child subviews in UIView, designed for easy switching between child view controllers with animations.
DESC


s.homepage         = 'https://github.com/EngrAhsanAli/AAFragmentManager'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'Engr. Ahsan Ali' => 'hafiz.m.ahsan.ali@gmail.com' }
s.source           = { :git => 'https://github.com/EngrAhsanAli/AAFragmentManager.git', :tag => s.version.to_s }

s.ios.deployment_target = '8.0'
s.pod_target_xcconfig = { 'SWIFT_VERSION' => '3.0' }

s.source_files = 'AAFragmentManager/Classes/**/*'

end

