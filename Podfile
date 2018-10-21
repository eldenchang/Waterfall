# Uncomment the next line to define a global platform for your project
platform :ios, '12.0'
#source 'https://github.com/mongodb/stitch-ios-sdk.git'
#source 'https://github.com/mongodb/stitch-ios-sdk/tree/master/Darwin'

target 'Waterfall' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Waterfall

#  pod 'StitchCore', :git => 'https://github.com/mongodb/stitch-ios-sdk.git'
#  pod 'StitchLocalMongoDBService', '~> 4.0.5'
#  pod 'StitchRemoteMongoDBService', '~> 4.0.5'
  pod 'StitchSDK', '~> 4.0.5'
  
  pod 'GoogleSignIn'
  pod 'FacebookLogin'

  target 'WaterfallTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'WaterfallUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end
