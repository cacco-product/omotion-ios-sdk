Pod::Spec.new do |s|
  s.name         = "OMotionSDK"
  s.version      = "1.0.0"
  s.summary      = "O-MOTION SDK for iOS"
  s.description  = <<-DESC
                     O-MOTION is an unauthorized access detection service developed and maintained by Cacco Inc.
                   DESC
  s.homepage     = "https://frauddetection.cacco.co.jp/o-motion/"
  s.license      = { :type => "Custom", :file => "LICENSE" }
  s.author       = "Cacco Inc."

  s.swift_version         = "5.9"
  s.ios.deployment_target = "13.0"
  s.cocoapods_version     = ">= 1.12.0"

  s.source       = { :git => "https://github.com/cacco-product/omotion-ios-sdk.git", :tag => "v#{s.version}" }
  s.vendored_frameworks = "OMotionIosSdk.xcframework"
end