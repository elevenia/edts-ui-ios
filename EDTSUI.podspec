Pod::Spec.new do |spec|

  spec.name         = "EDTSUI"
  spec.version      = "0.1.20"
  spec.summary      = "EDTSUI is an iOS SDK for design user interface"
  spec.description  = "EDTSUI is an iOS SDK that help developer to design user interface based on EDTS Design System."

  spec.homepage     = "https://github.com/elevenia/edts-ui-ios"
  spec.license      = { :type => "MIT", :file => "LICENSE" }

  spec.author       = { "Victor Agung Sukarno" => "victor.sukarno@sg-edts.com", "Alfin Syahruddin" => "muhammad.alfin@sg-edts.com" }

  spec.platform     = :ios
  spec.platform     = :ios, "11.0"
  spec.swift_version = '5.0'
  
  spec.source       = { :git => "https://github.com/elevenia/edts-ui-ios.git", :tag => spec.version }


  spec.source_files  = "EDTSUI", "EDTSUI/**/*.{h,m}"
  spec.resources = ['EDTSUI/**/*.{xib}']

  spec.subspec 'Color' do |ss|
    ss.source_files = 'EDTSUI/Atoms/Color'
  end

  spec.subspec 'Font' do |ss|
    ss.source_files = 'EDTSUI/Atoms/Font'
  end

  spec.subspec 'Assets' do |ss|
    ss.source_files = 'EDTSUI/Assets'
    ss.resource_bundle = { 'EDTSUIAssets' => 'EDTSUI/**/*.xcassets' }
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

  spec.subspec 'Onboarding' do |ss|
    ss.source_files = 'EDTSUI/Modules/Onboarding'
    ss.resources = ['EDTSUI/Modules/Onboarding/*.{xib}']
  end

  spec.subspec 'Stepper' do |ss|
    ss.source_files = 'EDTSUI/Components/Stepper'
    ss.resources = ['EDTSUI/Components/Stepper/*.{xib}']
  end

  spec.subspec 'SuccessPage' do |ss|
    ss.source_files = 'EDTSUI/Modules/SuccessPage'
    ss.resources = ['EDTSUI/Modules/SuccessPage/*.{xib}']
  end

  spec.subspec 'Toaster' do |ss|
    ss.source_files = 'EDTSUI/Components/Toaster'
    ss.resources = ['EDTSUI/Components/Toaster/*.{xib}']
  end

  spec.subspec 'Dropzone' do |ss|
    ss.source_files = 'EDTSUI/Components/Dropzone'
    ss.resources = ['EDTSUI/Components/Dropzone/*.{xib}']
  end

  spec.subspec 'List' do |ss|
    ss.source_files = 'EDTSUI/Components/List'
    ss.resources = ['EDTSUI/Components/List/*.{xib}']
  end

  spec.subspec 'Dropdown' do |ss|
    ss.source_files = 'EDTSUI/Components/Dropdown'
    ss.resources = ['EDTSUI/Components/Dropdown/*.{xib}']
  end

  spec.subspec 'Base' do |ss|
    ss.source_files = 'EDTSUI/Base/**/*.{swift}'
  end

  spec.subspec 'Extensions' do |ss|
    ss.source_files = 'EDTSUI/Extensions/*.{swift}'
  end

  spec.subspec 'Helpers' do |ss|
    ss.source_files = 'EDTSUI/Helpers/*.{swift}'
  end

  spec.subspec 'DatePicker' do |ss|
    ss.source_files = 'EDTSUI/Components/DatePicker/**/*.{swift}'
    ss.resources = ['EDTSUI/Components/DatePicker/**/*.{xib}']
    ss.dependency "EDTSUI/Assets"
    ss.dependency "EDTSUI/Base"
    ss.dependency "EDTSUI/Extensions"
    ss.dependency "EDTSUI/Textfield"
  end

  spec.subspec 'FittedTableView' do |ss|
    ss.source_files = 'EDTSUI/Components/FittedTableView'
  end

  spec.subspec 'FittedCollectionView' do |ss|
    ss.source_files = 'EDTSUI/Components/FittedCollectionView'
  end

  spec.subspec 'RangeSlider' do |ss|
    ss.source_files = 'EDTSUI/Components/RangeSlider/**/*.{swift}'
    ss.dependency "EDTSUI/Color"
  end

  spec.subspec 'EDTSUIView' do |ss|
    ss.source_files = 'EDTSUI/Components/EDTSUIView'
  end

  spec.subspec 'QRCodeView' do |ss|
    ss.source_files = 'EDTSUI/Components/QRCodeView/**/*.{swift}'
    ss.resources = ['EDTSUI/Components/QRCodeView/**/*.{xib}']
    ss.dependency "EDTSUI/Assets"
    ss.dependency "EDTSUI/Base"
    ss.dependency "EDTSUI/Helpers"
  end

  spec.subspec 'MenuTray' do |ss|
    ss.source_files = 'EDTSUI/Components/MenuTray/**/*.{swift}'
    ss.resources = ['EDTSUI/Components/MenuTray/**/*.{xib}']
    ss.dependency "EDTSUI/Assets"
    ss.dependency "EDTSUI/Base"
    ss.dependency "EDTSUI/FittedTableView"
  end

  spec.subspec 'AlertTray' do |ss|
    ss.source_files = 'EDTSUI/Components/AlertTray'
    ss.resources = ['EDTSUI/Components/AlertTray/**/*.{xib}']
    ss.dependency "EDTSUI/Assets"
    ss.dependency "EDTSUI/Base"
  end

  spec.subspec 'InformationView' do |ss|
    ss.source_files = 'EDTSUI/Components/InformationView/**/*.{swift}'
    ss.resources = ['EDTSUI/Components/InformationView/**/*.{xib}']
    ss.dependency "EDTSUI/Assets"
    ss.dependency "EDTSUI/Base"
    ss.dependency "EDTSUI/Extensions"
    ss.dependency "EDTSUI/Helpers"
    ss.dependency "EDTSUI/EDTSUIView"
  end

  spec.subspec 'Options' do |ss|
    ss.source_files = 'EDTSUI/Components/Options/**/*.{swift}'
    ss.resources = ['EDTSUI/Components/Options/**/*.{xib}']
    ss.dependency "EDTSUI/Assets"
    ss.dependency "EDTSUI/Base"
    ss.dependency "EDTSUI/FittedCollectionView"
  end

end
