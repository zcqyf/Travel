//
//  Fileupload.h
//  sanda
//
//  Created by Mac on 17/4/24.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum _uploadtype{
    image,
    video,
    file
} uploadtype;
@interface Fileupload : NSObject

+(instancetype)shareFileupload;

- (void)Fileupload:(NSData*)fileData choseType:(uploadtype)type WithDataBlock:(void(^)(id data))dataBLock;

@end
