//
//  TOPublishTableViewCell.m
//  TravelAPP
//
//  Created by qing on 2017/5/9.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "TOPublishTableViewCell.h"

@interface TOPublishTableViewCell()
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation TOPublishTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.textView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.textView.layer.borderWidth = 0.5;
    self.textView.layer.cornerRadius = 5;
    self.textView.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
