//
//  ViewController.m
//  NotificationUnitTest
//
//  Created by masamaso-tech on 13-6-8.
//  Copyright (c) 2013年 窦静轩. All rights reserved.
//

#import "ViewController.h"
#import "CNotificationCenter.h"
#import "Marcos.h"
#import "SecondViewController.h"
#import "DRTools.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize firstNumber,secondNumber;
#pragma mark  VC 生命周期
- (void)dealloc
{
    self.firstNumber = nil;
    self.secondNumber = nil;
    [self removeNotifications];
    [super dealloc];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    /*作者:窦静轩    描述:创建Nav的Button*/
    [self addNavButton];
    
    /*作者:窦静轩    描述:添加注册信息*/
    [self addNotification];
    
    /*作者:窦静轩    描述:初始化数据*/
    [self doInitDataSource];
    
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
-(void)doInitDataSource
{
    self.firstNumber = @"0";
    self.secondNumber = @"0";
    
    
    _firstPageLabel.text = self.firstNumber;
    _secondPageLabel.text = self.secondNumber;
}

-(void)addNotification
{
    NSMutableArray * notificationsArray = [[NSMutableArray alloc] initWithObjects: First_Page_Add,First_Page_Del,nil];
    [CNotificationCenter cAddNotifications:notificationsArray Obersver:self];
    [notificationsArray release];
}
-(void)addNavButton
{    
    UIButton * nextButton = [DRTools createNavButtonWithTitle:@"下一页" withHorPadding:4.0];
    [nextButton addTarget:self action:@selector(pushToNext:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * nextBarButton =[[[UIBarButtonItem alloc] initWithCustomView:nextButton] autorelease];
    self.navigationItem.rightBarButtonItem = nextBarButton;
}
-(IBAction)addButtonClicked:(id)sender
{
    [CNotificationCenter cPostNotification:Second_Page_Add withObject:nil];
}
-(IBAction)delButtonClicked:(id)sender
{
    [CNotificationCenter cPostNotification:Second_Page_Del withObject:nil];
}

-(void)removeNotifications
{
    [CNotificationCenter cMoveNotificationsObersver:self];
}

-(void)handleNotification:(NSNotification*)notification
{
    if ([notification.name isEqualToString:First_Page_Add]) {
        NSLog(@"First_Page_Add is %@",First_Page_Add);
        if ( nil !=notification.object) {
            NSDate * date = (NSDate*)notification.object;
            NSLog(@"date is %@",date);
        }
        NSString * tmpString = [NSString stringWithFormat:@"%d",[self.firstNumber intValue] + 1];
        self.firstNumber = tmpString;
        NSLog(@"_firstNumber is %@",self.firstNumber);
        _firstPageLabel.text = self.firstNumber;
    }
    else if ([notification.name isEqualToString:First_Page_Del]){
         NSLog(@"First_Page_Add is %@",First_Page_Del);
        if ( nil !=notification.object) {
            NSDate * date = (NSDate*)notification.object;
            NSLog(@"date is %@",date);
        }
       NSString * tmpString = [NSString stringWithFormat:@"%d",[self.secondNumber intValue] - 1];
        self.secondNumber = tmpString;
        NSLog(@"_secondNumber is %@",self.secondNumber);
        _secondPageLabel.text = self.secondNumber;
    }
}
-(void)pushToNext:(id)sender
{
    SecondViewController * svc = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:svc animated:YES];
    [svc release];
}

@end
