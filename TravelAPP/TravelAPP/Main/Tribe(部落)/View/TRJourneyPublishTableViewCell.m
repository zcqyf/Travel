//
//  TRJourneyPublishTableViewCell.m
//  TravelAPP
//
//  Created by qing on 2017/5/9.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "TRJourneyPublishTableViewCell.h"

@interface TRJourneyPublishTableViewCell()
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end
@implementation TRJourneyPublishTableViewCell

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
