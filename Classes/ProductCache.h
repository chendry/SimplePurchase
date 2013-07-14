
#import <Foundation/Foundation.h>
#import "ProductLoader.h"

@interface ProductCache : NSObject

- (void)loadProduct:(NSString *)productId block:(ProductLoadBlock)block;

@end
