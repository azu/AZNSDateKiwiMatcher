Pod::Spec.new do |s|
  s.name                  = "AZNSDateKiwiMatcher"
  s.version               = "1.0.0"
  s.summary               = "Kiwi Custom Matcher for Date comparing."
  s.homepage              = "https://github.com/azu/AZNSDateKiwiMatcher"
  s.license               = {:type => "MIT", :file => "LICENSE"}
  s.author                = {"azu" => "info@efcl.info"}
  s.source                = {
      :git => "https://github.com/azu/AZNSDateKiwiMatcher.git",
      :tag => s.version.to_s
  }
  s.ios.deployment_target = '6.0'
  s.source_files          ="AZNSDateKiwiMatcher/**/*.{h,m}"
  s.requires_arc          = true
  s.dependency "Kiwi"
end
