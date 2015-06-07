//
//  LAViewController.h
//  气象通
//
//  Created by 2-4 on 14-7-11.
//  Copyright (c) 2014年 jack-Asutin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LAViewController : UIViewController
//声明Button变量
@property (strong, nonatomic) IBOutlet UIBarButtonItem *barButtonItem;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *barButtonItem1;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *barButtonItem2;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *barButtonItem3;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *barButtonItem4;
//声明输出变量Label
@property (strong, nonatomic) IBOutlet UILabel *tempLabel;
@property (strong, nonatomic) IBOutlet UILabel *weatherLabel;
@property (strong, nonatomic) IBOutlet UILabel *windLabel;
@property (strong, nonatomic) IBOutlet UILabel *windLabel1;
@property (strong, nonatomic) IBOutlet UILabel *humidityLabel;
@property (strong, nonatomic) IBOutlet UILabel *precipitationLabel;
@property (strong, nonatomic) IBOutlet UILabel *obstimeLabel;
@property (strong, nonatomic) IBOutlet UILabel *dataLabel;


//声明Button被按下时的行为函数
- (IBAction)pressedButton:(id)sender;



@end
