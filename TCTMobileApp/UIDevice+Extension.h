//
//  UIDevice+Extension.h
//  ydoa
//
//  Created by zmx on 16/1/29.
//  Copyright © 2016年 zmx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (Extension)
/**
 *  获取当前的设备型号
 *
 *  @return 设备型号
 */
+ (NSString *)getCurrentDeviceModel;

/**
 * 设备型号的判断
 */
+ (BOOL)isIPhone4s;
+ (BOOL)isIPhone5;
+ (BOOL)isIPhone5s;
+ (BOOL)isIPhone6;
+ (BOOL)isIPhone6Plus;
+ (BOOL)isIPhone6s;
+ (BOOL)isIPhone6sPlus;
+ (BOOL)isIPad1;
+ (BOOL)isIPad2;
+ (BOOL)isIPad3;
+ (BOOL)isIPadMini;
+ (BOOL)isIPadMini2;
+ (BOOL)isIPadMini3;
+ (BOOL)isIPadAir;
+ (BOOL)isIPadAir2;
@end
