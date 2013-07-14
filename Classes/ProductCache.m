
#import "ProductCache.h"

@implementation ProductCache
{
    NSMutableDictionary *_loaders;
    NSMutableDictionary *_products;
}

- (id)init
{
    if (self = [super init])
    {
        _loaders = [[NSMutableDictionary alloc] init];
        _products = [[NSMutableDictionary alloc] init];
    }
    
    return self;
}

- (void)loadProduct:(NSString *)productId block:(ProductLoadBlock)block;
{
    if (_products[productId])
    {
        block(_products[productId], nil);
        return;
    }

    if (_loaders[productId])
    {
        [((ProductLoader *)_loaders[productId]) registerObserver:block];
        return;
    }

    ProductLoader *loader = [[ProductLoader alloc] initWithProductId:productId onFinish:^
     {
         [_loaders removeObjectForKey:productId];
     }];

    _loaders[productId] = loader;

    [loader registerObserver:^(SKProduct *product, NSError *error)
     {
         if (product)
             [_products setObject:product forKey:productId];
     }];

    [loader registerObserver:block];
    [loader start];
}

@end
