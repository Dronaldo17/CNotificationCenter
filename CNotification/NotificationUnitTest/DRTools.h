//
//  DRTools.h
//  CNotification
//
//  Created by masamaso-tech on 13-6-8.
//  Copyright (c) 2013年 窦静轩. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DRTools : NSObject

/*作者:窦静轩    描述:创建右导航按键*/
+ (UIButton *)createNavButtonWithTitle:(NSString *)title withHorPadding:(CGFloat)padding;

/*作者:窦静轩    描述:创建左导航按键*/
+ (UIButton *)createPopButton:(NSString*)title withHorPadding:(CGFloat)padding;
@end
