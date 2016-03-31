//
//  TCTColor.m
//  TCTMobileApp
//
//  Created by TCT on 16/3/31.
//  Copyright © 2016年 TCT. All rights reserved.
//

#import "TCTColor.h"

@implementation TCTColor
+ (UIColor *)randomColor {
    return [UIColor colorWithRed:arc4random_uniform(255) / 255.0 green:arc4random_uniform(255) / 255.0 blue:arc4random_uniform(255) / 255. alpha:1.0];
}


@end
