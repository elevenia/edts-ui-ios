Pod::Spec.new do |spec|

  spec.name         = "EDTSUI"
  spec.version      = "0.1.8"
  spec.summary      = "EDTSUI is an iOS SDK for design user interface"
  spec.description  = "EDTSUI is an iOS SDK that help developer to design user interface based on EDTS Design System."

  spec.homepage     = "https://github.com/elevenia/edts-ui-ios"
  spec.license      = { :type => "MIT", :file => "LICENSE" }

  spec.author             = { "Victor Agung Sukarno" => "victor.sukarno@sg-edts.com", "Alfin Syahruddin" => "muhammad.alfin@sg-edts.com" }

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

  spec.subspec 'BaseTray' do |ss|
    ss.source_files = 'EDTSUI/Components/BaseTray'
    ss.resources = ['EDTSUI/Components/BaseTray/*.{xib}']
  end

  spec.subspec 'DatePicker' do |ss|
    ss.source_files = 'EDTSUI/Components/DatePicker'
    ss.resources = ['EDTSUI/Components/DatePicker/*.{xib}']
  end

  spec.subspec 'FittedTableView' do |ss|
    ss.source_files = 'EDTSUI/Components/FittedTableView'
    ss.resources = ['EDTSUI/Components/FittedTableView/*.{xib}']
  end

  spec.subspec 'FittedCollectionView' do |ss|
    ss.source_files = 'EDTSUI/Components/FittedCollectionView'
    ss.resources = ['EDTSUI/Components/FittedCollectionView/*.{xib}']
  end

  spec.subspec 'RangeSlider' do |ss|
    ss.source_files = 'EDTSUI/Components/RangeSlider'
    ss.resources = ['EDTSUI/Components/RangeSlider/*.{xib}']
  end

  spec.subspec 'EDTSUIView' do |ss|
    ss.source_files = 'EDTSUI/Components/EDTSUIView'
    ss.resources = ['EDTSUI/Components/EDTSUIView/*.{xib}']
  end

  spec.subspec 'QRCodeView' do |ss|
    ss.source_files = 'EDTSUI/Components/QRCodeView'
    ss.resources = ['EDTSUI/Components/QRCodeView/*.{xib}']
  end

  spec.subspec 'MenuTray' do |ss|
    ss.source_files = 'EDTSUI/Components/MenuTray'
    ss.resources = ['EDTSUI/Components/MenuTray/*.{xib}']
  end

  spec.subspec 'AlertTray' do |ss|
    ss.source_files = 'EDTSUI/Components/AlertTray'
    ss.resources = ['EDTSUI/Components/AlertTray/*.{xib}']
  end

  spec.subspec 'InformationView' do |ss|
    ss.source_files = 'EDTSUI/Components/InformationView'
    ss.resources = ['EDTSUI/Components/InformationView/*.{xib}']
  end

  spec.subspec 'CheckboxOptions' do |ss|
    ss.source_files = 'EDTSUI/Components/CheckboxOptions'
    ss.resources = ['EDTSUI/Components/CheckboxOptions/*.{xib}']
  end

  spec.subspec 'RadioOptions' do |ss|
    ss.source_files = 'EDTSUI/Components/RadioOptions'
    ss.resources = ['EDTSUI/Components/RadioOptions/*.{xib}']
  end



end
