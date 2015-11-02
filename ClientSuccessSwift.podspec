Pod::Spec.new do |s|

s.platform = :ios
s.ios.deployment_target = '9.0'
s.name = "ClientSuccessSwift"
s.summary = "ClientSuccessSwift provides a method to create an even using the clientsuccess API"
s.requires_arc = true

s.version = "0.1.0"

s.license = { :type => "MIT", :file => "LICENSE" }

s.author = { "Jose L. Matus" => "jlmatus@gmail.com" }

s.homepage = "https://github.com/jlmatus/ClientSuccessAPI"

s.source = { :git => "https://github.com/jlmatus/ClientSuccessAPI.git", :tag => "#{s.version}"}

s.framework = "UIKit"

s.source_files = "ClientSuccess/**/*.{swift}"

s.resources = "ClientSuccess/**/*.{png,jpeg,jpg,storyboard,xib}"
end