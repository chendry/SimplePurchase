Pod::Spec.new do |s|
  s.name = "SimplePurchase"
  s.version = "0.0.1"
  s.summary = "A simple interface for in-app purchases"
  s.description = <<-DESC
    SimplePurchase exposes two static methods, shamelessly
    copied from Parse's in-app-purchase API:

        + (void)addObserverForProduct:(NSString *)productId block:(void(^)(SKPaymentTransaction *transaction))block
        + (void)buyProduct:(NSString *)productId block:(void(^)(NSError *error))block;
    DESC
  s.homepage = "http://github.com/chendry/SimplePurchase"
  s.author = { "Chad Hendry" => "chendry@chendry.org" }
  s.source = { :git => "http://github.com/chendry/SimplePurchase.git", :tag => "0.0.1" }
  s.platform = :ios, '5.0'
  s.source_files = "Classes"
  s.public_header_files = "Classes"
  s.framework = "StoreKit"
  s.requires_arc = true
end
