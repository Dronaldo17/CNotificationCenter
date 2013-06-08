//
//  SecondViewController.m
//  CNotification
//
//  Created by masamaso-tech on 13-6-8.
//  Copyright (c) 2013年 窦静轩. All rights reserved.
//

#import "SecondViewController.h"
#import "CNotificationCenter.h"
#import "Marcos.h"
#import "DRTools.h"

@interface SecondViewController ()

@end

@implementation SecondViewController
#pragma mark  VC 生命周期
- (void)dealloc
{
    [self removeNotifications];
    [super dealloc];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
//    /*作者:窦静轩    描述:创建Nav的Button*/
//    [self addNavButton];
    
    /*作者:窦静轩    描述:添加注册信息*/
    [self addNotification];
    
//    /*作者:窦静轩    描述:初始化数据*/
//    [self doInitDataSource];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

#pragma mark Private
-(void)addNotification
{
    NSMutableArray * notificationsArray = [[NSMutableArray alloc] initWithObjects: Second_Page_Add,Second_Page_Del,nil];
    [CNotificationCenter cAddNotifications:notificationsArray Obersver:self];
    [notificationsArray release];
}
-(void)addNavButton
{
//    self.navigationItem.backBarButtonItem = nil;
//    UIButton * preButton = [DRTools createPopButton:@"返回" withHorPadding:4.0];
//    [preButton addTarget:self action:@selector(popClicked:) forControlEvents:UIControlEventTouchUpInside];
//    UIBarButtonItem * preBarButton =[[[UIBarButtonItem alloc] initWithCustomView:preButton] autorelease];
//    self.navigationItem.leftBarButtonItem = preBarButton;
}
-(IBAction)addButtonClicked:(id)sender
{
    /*作者:窦静轩    描述:这个是个演示  WithObject 可以是id类型   这里演示用date*/

    NSDate * date = [NSDate date];
    
    [CNotificationCenter cPostNotification:First_Page_Add withObject:date];
}
-(IBAction)delButtonClicked:(id)sender
{
    /*作者:窦静轩    描述:这个是个演示  WithObject 可以是id类型   这里演示用date*/
    
    NSDate * date = [NSDate date];
    [CNotificationCenter cPostNotification:First_Page_Del withObject:date];
}

-(void)removeNotifications
{
    [CNotificationCenter cMoveNotificationsObersver:self];
}

-(void)handleNotification:(NSNotification*)notification
{
    if ([notification.name isEqualToString:Second_Page_Add]) {
        NSLog(@"First_Page_Add is %@",Second_Page_Add);
        
    }
    else if ([notification.name isEqualToString:Second_Page_Del]){
        NSLog(@"First_Page_Add is %@",Second_Page_Del);
    }
}
//-(void)popClicked:(id)sender
//{
//    [self.navigationController popViewControllerAnimated:YES];
//}
@end
