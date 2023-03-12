#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  spec.name = "AirKit"
  spec.version = "0.8.1"
  spec.summary = "Many extensions to speed up your coding time!"

  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!
  spec.description = <<-DESC
  This is sugar framework that contains many different extensions for native Swift and iOS frameworks
                   DESC

  spec.homepage = "https://github.com/yurii-lysytsia/#{spec.name}"

  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Licensing your code is important. See https://choosealicense.com for more info.
  #  CocoaPods will detect a license file if there is a named LICENSE*
  #  Popular ones are 'MIT', 'BSD' and 'Apache License, Version 2.0'.
  #

  spec.license = { :type => "MIT", :file => "LICENSE" }


  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the authors of the library, with email addresses. Email addresses
  #  of the authors are extracted from the SCM log. E.g. $ git log. CocoaPods also
  #  accepts just a name if you'd rather not provide an email address.
  #
  #  Specify a social_media_url where others can refer to, for example a twitter
  #  profile URL.
  #

  spec.author = { "Yurii Lysytsia" => "developer.yurii.lysytsia@gmail.com" }

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If this Pod runs only on iOS or OS X, then specify the platform and
  #  the deployment target. You can optionally include the target after the platform.
  #

  spec.ios.deployment_target = "12.0"
  spec.swift_versions = '5.7'
  
  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the location from where the source should be retrieved.
  #  Supports git, hg, bzr, svn and HTTP.
  #

  spec.source = { :git => "https://github.com/yurii-lysytsia/#{spec.name}.git", :tag => "#{spec.version}" }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  CocoaPods is smart about how it includes source code. For source files
  #  giving a folder will include any swift, h, m, mm, c & cpp files.
  #  For header files it will include any header in the folder.
  #  Not including the public_header_files will make all headers public.
  #

  # Remove prefix header file and select custom module map to avoid redundant UIKit import
  spec.prefix_header_file = false
  spec.module_map = "#{spec.name}.modulemap"

  spec.default_subspecs = "Core", "CoreUI", "Other"

  # ――― Source Code (Umbrella) ――――――――――――――――――――――――――――――――――――――――――――――――――― #

  spec.subspec "Umbrella" do |subspec|
    subspec.source_files = "#{spec.name}-umbrella.h"
  end

  # ――― Source Code (Core) ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  spec.subspec "Swift" do |subspec|
    subspec.dependency "#{spec.name}/Umbrella"
    subspec.source_files = "#{spec.name}/Swift/**/*.swift"
  end

  spec.subspec "Foundation" do |subspec|
    subspec.dependency "#{spec.name}/Umbrella"
    subspec.dependency "#{spec.name}/Swift"
    subspec.source_files = "#{spec.name}/Foundation/**/*.swift"
  end

  spec.subspec "Combine" do |subspec|
    subspec.dependency "#{spec.name}/Umbrella"
    subspec.source_files = "#{spec.name}/Combine/**/*.swift"
  end

  spec.subspec 'Core' do |subspec|
    subspec.dependency "#{spec.name}/Foundation"
    subspec.dependency "#{spec.name}/Combine"
  end

  # ――― Source Code (CoreUI) ――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  
  spec.subspec "QuartzCore" do |subspec|
    subspec.dependency "#{spec.name}/Umbrella"
    subspec.dependency "#{spec.name}/Swift"
    subspec.source_files = "#{spec.name}/QuartzCore/**/*.swift"
  end

  spec.subspec "CoreImage" do |subspec|
    subspec.dependency "#{spec.name}/Umbrella"
    subspec.source_files = "#{spec.name}/CoreImage/**/*.swift"
  end
  
  spec.subspec "UIKit" do |subspec|
    subspec.dependency "#{spec.name}/Umbrella"
    subspec.dependency "#{spec.name}/Foundation"
    subspec.dependency "#{spec.name}/QuartzCore"
    subspec.dependency "#{spec.name}/CoreImage"
    subspec.source_files = "#{spec.name}/UIKit/**/*.swift"
  end
  
  spec.subspec "CoreUI" do |subspec|
    subspec.dependency "#{spec.name}/UIKit"
  end

  # ――― Source Code (Other) ―――――――――――――――――――――――――――――――――――――――――――――――――――――- #

  spec.subspec "CoreLocation" do |subspec|
    subspec.dependency "#{spec.name}/Umbrella"
    subspec.source_files = "#{spec.name}/CoreLocation/**/*.swift"
  end

  spec.subspec "MapKit" do |subspec|
    subspec.dependency "#{spec.name}/Umbrella"
    subspec.dependency "#{spec.name}/UIKit"
    subspec.source_files = "#{spec.name}/MapKit/**/*.swift"
  end

  spec.subspec "WebKit" do |subspec|
    subspec.dependency "#{spec.name}/Umbrella"
    subspec.source_files = "#{spec.name}/WebKit/**/*.swift"
  end

  spec.subspec "LocalAuthentication" do |subspec|
    subspec.dependency "#{spec.name}/Umbrella"
    subspec.source_files = "#{spec.name}/LocalAuthentication/**/*.swift"
  end

  spec.subspec "Other" do |subspec|
    subspec.dependency "#{spec.name}/CoreLocation"
    subspec.dependency "#{spec.name}/MapKit"
    subspec.dependency "#{spec.name}/WebKit"
    subspec.dependency "#{spec.name}/LocalAuthentication"
  end
end
