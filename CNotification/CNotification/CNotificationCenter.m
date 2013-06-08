//
//  CNotificationCenter.m
//  GTMHttp
//
//  Created by masamaso-tech on 13-6-8.
//  Copyright (c) 2013年 窦静轩. All rights reserved.
//

#import "CNotificationCenter.h"

@implementation CNotificationCenter
/*作者:窦静轩    描述:注册通知数组*/
+(void)cAddNotifications:(NSArray*)notifications Obersver:(id)observer
{
    if (nil != observer) {
        [observer retain];
    }
    else{
        return;
    }
    
     if ([notifications count] > 0) {
        for (int i = 0; i < notifications.count; i++) {
                NSString * notificationName = [notifications objectAtIndex:i];
            
            /*作者:窦静轩    描述:每个注册者需要在各自实现.m文件实现该方法  handleNotification: */

                [[NSNotificationCenter defaultCenter] addObserver:observer
                                                         selector:@selector(handleNotification:)
                                                             name:notificationName
                                                           object:nil];
            
            
            }
    }
    [observer  release];
    
}

/*作者:窦静轩    描述:取消通知数组*/
+(void)cMoveNotificationsObersver:(id)observer
{
     if (nil != observer) {
        [[NSNotificationCenter defaultCenter] removeObserver:observer];
     }
}

/*作者:窦静轩    描述:发通知给观察者*/
+(void)cPostNotification:(NSString*)notificationName  withObject:(id)objectInfo
{
    if (nil == notificationName || nil == objectInfo) {
        return;
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:notificationName object:objectInfo];
}

/*作者:窦静轩    描述:注册者取消单个通知*/
+(void)cMoveNotification:(NSString*)notificationName Obersver:(id)observer
{
    if (nil == observer || nil == notificationName) {
        return;
    }
    else{
        [[NSNotificationCenter defaultCenter] removeObserver:observer name:notificationName object:nil];
    }
}
@end
