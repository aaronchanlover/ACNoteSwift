
platform :ios, ’9.0’
use_frameworks!

def sharedPods
    #RxSwift
    pod 'RxSwift',    '~> 4.0.0-alpha.1'
    pod 'RxCocoa',    '~> 4.0.0-alpha.1'
    
    pod 'Moya/RxSwift', '~> 10.0.0-beta.1'
    pod 'SwiftyJSON', '~> 4.0.0-alpha.1'
    pod 'RxDataSources', '~> 3.0.0-rc.0'
end

def testPods
#    pod 'Quick', '1.1.0'
#    pod 'Nimble', '6.1.0'
    pod 'RxBlocking', '~> 4.0.0-alpha.1'
end

target 'ACNoteSwift' do

#公共库
sharedPods

pod 'Alamofire', '~> 4.5.0'
#pod 'IQKeyboardManagerSwift', :git => 'https://github.com/hackiftekhar/IQKeyboardManager.git', :branch => 'swift4'
pod 'SnapKit', '~> 4.0.0'
#pod 'SnapKit', '~> 3.2.0'
pod 'SQLite.swift', '~> 0.11.4'

#pod 'CartographyKit', '~> 0.1.3'
#pod 'SCLAlertView', '~> 0.7.0'


pod 'ACLibSwift/QRCode',:git=>'https://github.com/aaronchanlover/ACLibSwift.git',:tag=>'0.2.0'
pod 'ACLibSwift/ACTabbarController',:git=>'https://github.com/aaronchanlover/ACLibSwift.git',:tag=>'0.2.0'


end

target 'ACNoteSwiftTests' do

sharedPods
testPods

end

target 'ACNoteSwiftUITests' do

end


