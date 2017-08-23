Pod::Spec.new do |s|
  s.name         = "UCSTextFieldReact"
  s.version      = "1.0.0"
  s.summary      = "UCSTextFieldReact"
  s.homepage     = "http://172.17.16.23:3000/Luzz/UCSTextFieldReact"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Frank Lu" => "arloou@foxmail.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "http://172.17.16.23:3000/Luzz/UCSTextFieldReact.git", :tag => s.version }
  s.source_files  = "UCSTextFieldReact/UCSTextFieldReact/*.{h,m,c}"
  # s.exclude_files = "UCSTextFieldReact/UCSTextFieldReact/UCSTextFieldReact.h"
  s.public_header_files = "UCSTextFieldReact/UCSTextFieldReact/UCSTextFieldReact.h"
  s.requires_arc = true
  s.frameworks   = 'UIKit' 
end
