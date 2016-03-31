//
//  TCTCollectionViewCell.h
//  TCTMobileApp
//
//  Created by TCT on 16/3/30.
//  Copyright © 2016年 TCT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TCTCollectionViewCell : UICollectionViewCell
/**
 *  设置cell中的图片以及名称
 *
 *  @param image 图片名
 *  @param title 标题
 */
- (void)collectionViewCellImage:(NSString *)image title:(NSString *)title;
@end
