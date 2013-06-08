//
//  DRTools.m
//  CNotification
//
//  Created by masamaso-tech on 13-6-8.
//  Copyright (c) 2013年 窦静轩. All rights reserved.
//

#import "DRTools.h"

@implementation DRTools
+ (UIButton *)createNavButtonWithTitle:(NSString *)title withHorPadding:(CGFloat)padding
{
    NSLog(@"title is %@",title);
    CGSize titleSize = CGSizeMake(45, 32);
    if (title && ![@"" isEqualToString:title]) {
        titleSize = [title sizeWithFont:[UIFont systemFontOfSize:14.0]];
        titleSize.width += 2 * padding;
        titleSize.height = 32;
    }
    UIButton *btn = [[[UIButton alloc] initWithFrame:CGRectMake(0, 0, titleSize.width, titleSize.height)] autorelease];
    [btn.titleLabel setFont:[UIFont systemFontOfSize:14.0]];
    UIImage *btnImage = [UIImage imageNamed:@"Nav_Button_1"];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setBackgroundImage:[btnImage stretchableImageWithLeftCapWidth:20 topCapHeight:15] forState:UIControlStateNormal];
    return btn;
}
+ (UIButton *)createPopButton:(NSString*)title withHorPadding:(CGFloat)padding
{
    title = @" 返回";
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 48, 30);
    [btn.titleLabel setFont:[UIFont systemFontOfSize:14.0]];
    [btn.titleLabel setTextAlignment:NSTextAlignmentCenter];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    UIImage *btnImage = [UIImage imageNamed:@"Nav_Back"];
    [btn setBackgroundImage:btnImage forState:UIControlStateNormal];
    return btn;
}
@end
