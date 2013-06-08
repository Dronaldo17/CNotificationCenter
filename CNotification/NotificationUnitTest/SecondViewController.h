//
//  SecondViewController.h
//  CNotification
//
//  Created by masamaso-tech on 13-6-8.
//  Copyright (c) 2013年 窦静轩. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController
{
    IBOutlet UIButton * _addButton;
    IBOutlet UIButton * _delButton;
}
-(IBAction)addButtonClicked:(id)sender;
-(IBAction)delButtonClicked:(id)sender;
@end
