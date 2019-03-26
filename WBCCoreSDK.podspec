

Pod::Spec.new do |spec|

  spec.platform =               :ios
  spec.name =                   "WBCCoreSDK"
  spec.version =                "1.0.0"
  spec.summary =                "Networking"
  spec.ios.deployment_target =  "12.0"
  spec.description  = "Swift Framework which encapsulates logic regarding network layer for WBC app"
  spec.homepage     = "https://github.com/ModernMantra/wbc-core-sdk.git"
  spec.license      = "MIT"
  spec.author       = { "SemonnomeS" => "vedad.njuhovic@hotmail.com" }
  spec.source       = { :git => "https://github.com/ModernMantra/wbc-core-sdk.git", :tag => "#{spec.version}" }
  spec.source_files  = "WBCCoreSDK/**/*.{swift}"
  spec.exclude_files = "WBCCoreSDKTests/**/*.{swift}"
  spec.swift_version = "4.2"
  spec .dependency 'Alamofire'

end
