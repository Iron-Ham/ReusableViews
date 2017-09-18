Pod::Spec.new do |s|
  s.name             = 'ReusableViews'
  s.version          = '1.0.0'
  s.summary          = 'Instantiate UIViewControllers from storyboards and dequeue views without a bang!'

  s.description      = <<-DESC
ReusableViews is a sugar library that allows you to dequeue UITableViewCells, UICollectionViewCells,
UITableViewHeaderFooterViews, UICollectionViewReusableViews (supplementary views) without a bang or force cast. It also
allows you to instantiate view controllers from the storyboard without using a bang or force casting.
                       DESC

  s.homepage         = 'https://github.com/heshamsalman/ReusableViews'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'heshamsalman' => 'hesham8@gmail.com' }
  s.source           = { :git => 'https://github.com/heshamsalman/ReusableViews.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/WhatsASoftware'

  s.ios.deployment_target = '9.0'

  s.source_files = 'ReusableViews/Classes/**/*'
end
