//
//  Fileupload.m
//  sanda
//
//  Created by Mac on 17/4/24.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "Fileupload.h"
#import "AFNetworking.h"
#import "HttpConstant.h"

@implementation Fileupload
+ (instancetype)shareFileupload{
    static Fileupload*share = nil;
    static dispatch_once_t oneToken;
    dispatch_once(&oneToken, ^{
        
    });
    return share;
}
-(void)Fileupload:(NSData *)fileData choseType:(uploadtype)type WithDataBlock:(void (^)(id data))dataBLock {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //接收类型不一致请替换一致text/html或别的
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",
                                                         @"text/html",
                                                         @"image/jpeg",
                                                         @"image/png",
                                                         @"application/octet-stream",
                                                         @"text/json",
                                                         nil];
   
    
    NSURLSessionDataTask *task = [manager POST:KTLSDKFileupload parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyyMMddHHmmss";
        NSString *str = [formatter stringFromDate:[NSDate date]];
        NSString *fileName = [NSString stringWithFormat:@"%@.jpg", str];
        //上传的参数(上传图片，以文件流的格式)
        switch (type) {
            case image:
                [formData appendPartWithFileData:fileData
                                            name:@"myfile"
                                        fileName:fileName
                                        mimeType:@"image/jpeg"];
                break;
            case video:
                [formData appendPartWithFileData:fileData
                                            name:@"myfile"
                                        fileName:fileName
                                        mimeType:@"video/mp4"];
                break;
            case file:
                [formData appendPartWithFileData:fileData
                                            name:@"myfile"
                                        fileName:fileName
                                        mimeType:@"text/plain"];
                break;
            default:
                break;
        }
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        //打印下上传进度
        NSLog(@"上传进度");
        NSLog(@"%@",uploadProgress);
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        //上传成功
        dataBLock(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        //上传失败
        dataBLock(error);
        
    }];
 
}
@end
