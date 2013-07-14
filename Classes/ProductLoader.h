
#import <Foundation/Foundation.h>
#import <StoreKit/StoreKit.h>

typedef void (^ProductLoadBlock)(SKProduct *, NSError *);

@interface ProductLoader : NSObject<SKProductsRequestDelegate>

- (id)initWithProductId:(NSString *)productId onFinish:(void(^)())onFinish;
- (void)registerObserver:(ProductLoadBlock)observer;
- (void)start;

@end
