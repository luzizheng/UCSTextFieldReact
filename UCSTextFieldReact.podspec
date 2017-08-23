Pod::Spec.new do |s|
  s.name         = "UCSTextFieldReact"
  s.version      = "1.0.0"
  s.summary      = "UCSTextFieldReact"
  s.homepage     = "https://github.com/luzizheng/UCSTextFieldReact"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Frank Lu" => "arloou@foxmail.com" }
  s.platform     = :ios, "8.0"
  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.8'
  s.source       = { :git => "https://github.com/luzizheng/UCSTextFieldReact.git", :tag => s.version }
  s.source_files  = "UCSTextFieldReact/UCSTextFieldReact/*.{h,m,c}"
  s.public_header_files = "UCSTextFieldReact/UCSTextFieldReact/*.{h}"
  s.requires_arc = true
  # s.frameworks   = 'UIKit' 
end
