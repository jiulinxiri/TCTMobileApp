//
//  UIDevice+Extension.m
//  ydoa
//
//  Created by zmx on 16/1/29.
//  Copyright © 2016年 zmx. All rights reserved.
//

#import "UIDevice+Extension.h"
#import "sys/utsname.h"

@implementation UIDevice (Extension)
/**
 *  获取设备的具体型号
 *
 *  @return 设备的型号
 */
+ (NSString *)getCurrentDeviceModel {
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];

    //iPhone
    if ([deviceString isEqualToString:@"iPhone1,1"])    return @"iPhone 1G";
    if ([deviceString isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
    if ([deviceString isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
    if ([deviceString isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
    if ([deviceString isEqualToString:@"iPhone3,2"])    return @"Verizon iPhone 4";
    if ([deviceString isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([deviceString isEqualToString:@"iPhone5,1"])    return @"iPhone 5";
    if ([deviceString isEqualToString:@"iPhone5,2"])    return @"iPhone 5";
    if ([deviceString isEqualToString:@"iPhone5,3"])    return @"iPhone 5C";
    if ([deviceString isEqualToString:@"iPhone5,4"])    return @"iPhone 5C";
    if ([deviceString isEqualToString:@"iPhone6,1"])    return @"iPhone 5S";
    if ([deviceString isEqualToString:@"iPhone6,2"])    return @"iPhone 5S";
    if ([deviceString isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
    if ([deviceString isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
    if ([deviceString isEqualToString:@"iPhone8,1"])    return @"iPhone 6s";
    if ([deviceString isEqualToString:@"iPhone8,2"])    return @"iPhone 6s Plus";
    
    //iPod
    if ([deviceString isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
    if ([deviceString isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
    if ([deviceString isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
    if ([deviceString isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
    if ([deviceString isEqualToString:@"iPod5,1"])      return @"iPod Touch 5G";
    
    //iPad
    if ([deviceString isEqualToString:@"iPad1,1"])      return @"iPad";
    if ([deviceString isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
    if ([deviceString isEqualToString:@"iPad2,2"])      return @"iPad 2 (GSM)";
    if ([deviceString isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    if ([deviceString isEqualToString:@"iPad2,4"])      return @"iPad 2 (32nm)";
    if ([deviceString isEqualToString:@"iPad2,5"])      return @"iPad mini (WiFi)";
    if ([deviceString isEqualToString:@"iPad2,6"])      return @"iPad mini (GSM)";
    if ([deviceString isEqualToString:@"iPad2,7"])      return @"iPad mini (CDMA)";
    
    if ([deviceString isEqualToString:@"iPad3,1"])      return @"iPad 3(WiFi)";
    if ([deviceString isEqualToString:@"iPad3,2"])      return @"iPad 3(CDMA)";
    if ([deviceString isEqualToString:@"iPad3,3"])      return @"iPad 3(4G)";
    if ([deviceString isEqualToString:@"iPad3,4"])      return @"iPad 4 (WiFi)";
    if ([deviceString isEqualToString:@"iPad3,5"])      return @"iPad 4 (4G)";
    if ([deviceString isEqualToString:@"iPad3,6"])      return @"iPad 4 (CDMA)";
    
    if ([deviceString isEqualToString:@"iPad4,1"])      return @"iPad Air";
    if ([deviceString isEqualToString:@"iPad4,2"])      return @"iPad Air";
    if ([deviceString isEqualToString:@"iPad4,3"])      return @"iPad Air";
    if ([deviceString isEqualToString:@"iPad5,3"])      return @"iPad Air 2";
    if ([deviceString isEqualToString:@"iPad5,4"])      return @"iPad Air 2";
    if ([deviceString isEqualToString:@"i386"])         return @"Simulator";
    if ([deviceString isEqualToString:@"x86_64"])       return @"Simulator";
    
    if ([deviceString isEqualToString:@"iPad4,4"]
        ||[deviceString isEqualToString:@"iPad4,5"]
        ||[deviceString isEqualToString:@"iPad4,6"])      return @"iPad mini 2";
    
    if ([deviceString isEqualToString:@"iPad4,7"]
        ||[deviceString isEqualToString:@"iPad4,8"]
        ||[deviceString isEqualToString:@"iPad4,9"])      return @"iPad mini 3";
    
    return deviceString;
}

+ (BOOL)isIPhone4s {
    return [[self getCurrentDeviceModel] isEqualToString:@"iPhone 4S"];
}

+ (BOOL)isIPhone5 {
    return [[self getCurrentDeviceModel] isEqualToString:@"iPhone 5"];
}

+ (BOOL)isIPhone5s {
    return [[self getCurrentDeviceModel] isEqualToString:@"iPhone 5S"];
}

+ (BOOL)isIPhone6 {
    return [[self getCurrentDeviceModel] isEqualToString:@"iPhone 6"];
}

+ (BOOL)isIPhone6Plus {
    return [[self getCurrentDeviceModel] isEqualToString:@"iPhone 6 Plus"];
}

+ (BOOL)isIPhone6s {
    return [[self getCurrentDeviceModel] isEqualToString:@"iPhone 6s"];
}

+ (BOOL)isIPhone6sPlus {
    return [[self getCurrentDeviceModel] isEqualToString:@"iPhone 6s Plus"];
}

+ (BOOL)isIPad1 {
    return [[self getCurrentDeviceModel] isEqualToString:@"iPad"];
}

+ (BOOL)isIPad2 {
    return [[self getCurrentDeviceModel] isEqualToString:@"iPad 2 (WiFi)"] || [[self getCurrentDeviceModel] isEqualToString:@"iPad 2 (GSM)"] || [[self getCurrentDeviceModel] isEqualToString:@"iPad 2 (CDMA)"] || [[self getCurrentDeviceModel] isEqualToString:@"iPad 2 (32nm)"];
}

+ (BOOL)isIPad3 {
    return [[self getCurrentDeviceModel] isEqualToString:@"iPad 3(WiFi)"] || [[self getCurrentDeviceModel] isEqualToString:@"iPad 3(CDMA)"] || [[self getCurrentDeviceModel] isEqualToString:@"iPad 3(4G)"];
}

+ (BOOL)isIPadMini {
    return [[self getCurrentDeviceModel] isEqualToString:@"iPad mini (WiFi)"] || [[self getCurrentDeviceModel] isEqualToString:@"iPad mini (GSM)"] || [[self getCurrentDeviceModel] isEqualToString:@"iPad mini (CDMA)"];
}

+ (BOOL)isIPadAir {
    return [[self getCurrentDeviceModel] isEqualToString:@"iPad Air"];
}

+ (BOOL)isIPadAir2 {
    return [[self getCurrentDeviceModel] isEqualToString:@"iPad Air2"];
}

+ (BOOL)isIPadMini2 {
    return [[self getCurrentDeviceModel] isEqualToString:@"iPad mini 2"];
}

+ (BOOL)isIPadMini3 {
    return [[self getCurrentDeviceModel] isEqualToString:@"iPad mini 3"];
}
@end
