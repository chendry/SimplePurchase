
#import <Foundation/Foundation.h>
#import <StoreKit/StoreKit.h>

@interface Purchaser : NSObject<SKPaymentTransactionObserver>

- (void)addObserverForProduct:(NSString *)productId block:(void(^)(SKPaymentTransaction *transaction))block;
- (void)buyProduct:(NSString *)productId block:(void (^)(NSError *))block;

@end
