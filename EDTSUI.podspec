Pod::Spec.new do |spec|

  spec.name         = "EDTSUI"
  spec.version      = "0.0.3"
  spec.summary      = "EDTSUI is an iOS SDK for Design Layout"
  spec.description  = "EDTSUI is a library based on iOS Swift language that help developer to design their layout more easier and according to EDTS Design System standardized."

  spec.homepage     = "https://github.com/elevenia/edts-ui-ios"
  spec.license      = { :type => "MIT", :file => "LICENSE" }

  spec.author             = { "Victor Agung Sukarno" => "victor.sukarno@sg-edts.com" }

  spec.platform     = :ios
  spec.platform     = :ios, "11.0"
  spec.swift_version = '5.0'
  
  spec.source       = { :git => "https://github.com/elevenia/edts-ui-ios.git", :tag => spec.version }


  spec.source_files  = "EDTSUI", "EDTSUI/**/*"
  spec.resources = ['EDTSUI/**/*.{xib}']

  spec.subspec 'Color' do |ss|
    ss.source_files = 'EDTSUI/Atoms/Color'
  end

  spec.subspec 'Font' do |ss|
    ss.source_files = 'EDTSUI/Atoms/Font'
  end

  spec.subspec 'OTP' do |ss|
    ss.source_files = 'EDTSUI/Components/OTP'
    ss.resources = ['EDTSUI/Components/OTP/*.{xib}']
  end

  spec.subspec 'Textfield' do |ss|
    ss.source_files = 'EDTSUI/Components/Textfield'
    ss.resources = ['EDTSUI/Components/Textfield/*.{xib}']
  end

  spec.subspec 'PopUp' do |ss|
    ss.source_files = 'EDTSUI/Modules/PopUp'
    ss.resources = ['EDTSUI/Modules/PopUp/*.{xib}']
  end

end
