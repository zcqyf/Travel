//
//  MineCollectionViewController.h
//  TravelAPP
//
//  Created by qing on 2017/5/10.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "BaseViewController.h"
#import "SelecterToolsScrollView.h"
#import "SelecterContentsScrollView.h"

@interface MineCollectionViewController : BaseViewController

@property (nonatomic, strong)NSArray *titleArray;
@property (nonatomic, strong)NSMutableArray *vcArray;
@property (nonatomic, strong)SelecterToolsScrollView *selecterToolScrollView;
@property (nonatomic, strong)SelecterContentsScrollView *selecterContentScrollView;

@end
