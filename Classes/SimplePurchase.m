
#import <StoreKit/StoreKit.h>
#import "SimplePurchase.h"
#import "Purchaser.h"

static Purchaser *_purchaser;

@implementation SimplePurchase

+ (void)initialize
{
    _purchaser = [[Purchaser alloc] init];
}

+ (void)addObserverForProduct:(NSString *)productId block:(void(^)(SKPaymentTransaction *transaction))block
{
    [_purchaser addObserverForProduct:productId block:block];
}

+ (void)buyProduct:(NSString *)productId block:(void(^)(NSError *error))block
{
    [_purchaser buyProduct:productId block:block];
}

@end
