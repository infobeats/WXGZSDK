

Pod::Spec.new do |s|



s.name         = "WXGZSDK"
s.version      = "1.9.4"
s.summary      = "WXGZSDK for 威胁感知"

s.description  = <<-DESC
WXGZSDK for 威胁感知
DESC

s.homepage     = "http://www.iyuedong.cn"
s.author             = { "infobeat" => "http://www.iyuedong.cn" }
s.platform     = :ios, "8.0"
s.ios.deployment_target = '8.0'

s.source       = { :git => "https://github.com/infobeats/WXGZSDK.git", :tag => s.version }


s.vendored_frameworks = ['SDK/OperationToolSDK.framework','SDK/WXGZ_SDK.framework']

s.resources =  ['SDK/OperationToolSDK.bundle','SDK/WXGZ_SDK.bundle']



end


