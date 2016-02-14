Pod::Spec.new do |s|
    s.name         = 'LSLayout'
    s.version      = '0.0.1'
    s.summary      = 'An easy way to use autoLayout'
    s.homepage     = 'https://github.com/sliu1126/LSLayout'
    s.license      = 'MIT'
    s.author       = { "sliu" => "1053209520@qq.com" }
    s.platform     = :ios,   "7.0"
    s.ios.deployment_target = "7.0"
    s.source       = {:git => 'https://github.com/sliu1126/LSLayout.git', :tag => s.version}
    s.source_files = 'LSLayout/LSLayout/**/*.{h,m}'
    s.requires_arc = true
end
