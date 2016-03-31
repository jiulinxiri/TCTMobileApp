//
//  TCTCollectionViewCell.m
//  TCTMobileApp
//
//  Created by TCT on 16/3/30.
//  Copyright © 2016年 TCT. All rights reserved.
//

#import "TCTCollectionViewCell.h"

@interface TCTCollectionViewCell ()
@property (nonatomic, weak) UIImageView *appIconView;
@property (nonatomic, weak) UILabel *nameLabel;
@end

@implementation TCTCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self p_setupSubviews];
    }
    
    return self;
}

- (void)p_setupSubviews {
    UIImageView *appIconView = [[UIImageView alloc] init];
    appIconView.layer.cornerRadius = 10;
    appIconView.layer.masksToBounds = YES;
    [self.contentView addSubview:appIconView];
    _appIconView = appIconView;
    
    CGFloat imageH = self.frame.size.width * 2.2 / 3;
    [appIconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self);
        make.height.mas_equalTo(imageH);
        make.width.mas_equalTo(imageH);
    }];
    
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.textAlignment = NSTextAlignmentCenter;
    nameLabel.font = [UIFont fontWithName:@"CourierNewPSMT" size:14];
//    nameLabel.backgroundColor = [TCTColor randomColor];
    [self addSubview:nameLabel];
    _nameLabel = nameLabel;
    
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(appIconView.mas_bottom);
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.bottom.equalTo(self);
    }];
}

- (void)collectionViewCellImage:(NSString *)image title:(NSString *)title {
    if (image) {
        _appIconView.image = [UIImage imageNamed:image];
    }
    
    if (title) {
        _nameLabel.text = title;
    }
}
@end
