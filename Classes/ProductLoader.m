
#import "ProductLoader.h"

@implementation ProductLoader
{
    NSString *_productId;
    NSMutableArray *_observers;
    SKProduct *_product;
    NSError *_error;
    void(^_onFinish)();
}

- (id)initWithProductId:(NSString *)productId onFinish:(void(^)())onFinish
{
    if (self = [super init])
    {
        _productId = productId;
        _observers = [[NSMutableArray alloc] init];
        _onFinish = onFinish;
    }
    
    return self;
}

- (void)registerObserver:(ProductLoadBlock)observer
{
    [_observers addObject:observer];
}

- (void)start
{
    NSSet *ids = [NSSet setWithObject:_productId];
    SKProductsRequest *req = [[SKProductsRequest alloc] initWithProductIdentifiers:ids];
    req.delegate = self;
    [req start];
}

- (void)request:(SKRequest *)request didFailWithError:(NSError *)error
{
    _error = error;
}

- (void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response
{
    _product = response.products[0];    
}

- (void)requestDidFinish:(SKRequest *)request
{
    for (ProductLoadBlock block in _observers)
        block(_product, _error);
    
    _onFinish();
}

@end
