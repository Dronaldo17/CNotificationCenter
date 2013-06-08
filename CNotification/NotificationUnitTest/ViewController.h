//
//  ViewController.h
//  NotificationUnitTest
//
//  Created by masamaso-tech on 13-6-8.
//  Copyright (c) 2013年 窦静轩. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    IBOutlet UILabel * _firstPageLabel;
    IBOutlet UILabel * _secondPageLabel;
    IBOutlet UIButton * _addButton;
    IBOutlet UIButton * _delButton;
}
@property (nonatomic,retain)NSString * firstNumber;
@property (nonatomic,retain)NSString * secondNumber;
-(IBAction)addButtonClicked:(id)sender;
-(IBAction)delButtonClicked:(id)sender;
@end
