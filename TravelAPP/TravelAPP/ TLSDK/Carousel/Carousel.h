//
//  Carousel.h
//  Bluetoothlock
//
//  Created by Mac on 17/5/17.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Carousel : NSObject
+(instancetype)shareCarousel;
- (void)getCarouselData:(NSDictionary*)param  WithDataBlock:(void(^)(id data))dataBLock;
@end
