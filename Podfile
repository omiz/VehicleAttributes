source 'https://github.com/CocoaPods/Specs.git'
use_frameworks!

platform :ios, '9.0'

#https://github.com/tristanhimmelman/AlamofireObjectMapper
pod 'AlamofireObjectMapper', '~> 4.0'

target 'VehicleAttributes' do
end

post_install do |installer|
   installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
         # Signing
         config.build_settings['PROVISIONING_PROFILE_SPECIFIER'] = config.name.include?('Debug') ? '<DEVERLOPER ID>/' : '<TEAM ID>/'
      end
   end
end
