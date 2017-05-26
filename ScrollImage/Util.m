//
//  Util.m
//  ScrollImage
//
//  Created by 武国斌 on 2017/5/26.
//  Copyright © 2017年 武国斌. All rights reserved.
//

#import "Util.h"

@implementation Util

+ (UIColor *) stringTOColor:(NSString *)str {
    
    if (!str || [str isEqualToString:@""]) {
        return nil;
    }
    
    unsigned red,green,blue;
    
    NSRange range;
    
    range.length = 2;
    
    range.location = 1;
    
    [[NSScanner scannerWithString:[str substringWithRange:range]] scanHexInt:&red];
    
    range.location = 3;
    
    [[NSScanner scannerWithString:[str substringWithRange:range]] scanHexInt:&green];
    
    range.location = 5;
    
    [[NSScanner scannerWithString:[str substringWithRange:range]] scanHexInt:&blue];
    
    UIColor *color= [UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:1];
    
    return color;
}

@end
