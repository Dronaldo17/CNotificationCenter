//
//  CNotificationCenter.h
//  GTMHttp
//
//  Created by masamaso-tech on 13-6-8.
//  Copyright (c) 2013年 窦静轩. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CNotificationCenter : NSObject
/*作者:窦静轩    描述:注册者注册通知数组*/
+(void)cAddNotifications:(NSArray*)notifications Obersver:(id)observer;

/*作者:窦静轩    描述:注册者取消所有通知数组*/
+(void)cMoveNotificationsObersver:(id)observer;

/*作者:窦静轩    描述:注册者取消单个通知*/
+(void)cMoveNotification:(NSString*)notificationName Obersver:(id)observer;

/*作者:窦静轩    描述:发通知给注册者*/
+(void)cPostNotification:(NSString*)notificationName  withObject:(id)objectInfo;


/*作者:窦静轩    描述:在此中心注册事件的对象 必须在实现文件里 完成函数
    -(void)handleNotification:(NSNotification*)notification
 */

@end
