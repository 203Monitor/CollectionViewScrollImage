//
//  Util.h
//  ScrollImage
//
//  Created by 武国斌 on 2017/5/26.
//  Copyright © 2017年 武国斌. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define CorlorWithString(string) ([Util stringTOColor:string])

@interface Util : NSObject

+ (UIColor *) stringTOColor:(NSString *)str;

@end
