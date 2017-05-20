//
//  CellModel.h
//  sanda
//
//  Created by Mac on 17/5/12.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CellModel : NSObject
//标题
@property (nonatomic,strong) NSString * title;
//图片
@property (nonatomic,strong) NSString * image;
//人数
@property (nonatomic,strong) NSString * member;
//价格
@property (nonatomic,strong) NSString * price;
//星级
@property (nonatomic,strong) NSString * Star;
@end
