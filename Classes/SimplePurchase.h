
#import <Foundation/Foundation.h>
#import <StoreKit/StoreKit.h>

@interface SimplePurchase : NSObject

+ (void)addObserverForProduct:(NSString *)productId block:(void(^)(SKPaymentTransaction *transaction))block;
+ (void)buyProduct:(NSString *)productId block:(void(^)(NSError *error))block;

@end
