//
//  LAViewController.m
//  气象通
//
//  Created by 2-4 on 14-7-11.
//  Copyright (c) 2014年 jack-Asutin. All rights reserved.
//

#import "LAViewController.h"
#import <UIKit/UIKit.h>
@interface LAViewController ()

@end

@implementation LAViewController
@synthesize barButtonItem;
@synthesize barButtonItem1;
@synthesize barButtonItem2;
@synthesize barButtonItem3;
@synthesize barButtonItem4;
@synthesize tempLabel;
@synthesize weatherLabel;
@synthesize windLabel;
@synthesize windLabel1;
@synthesize humidityLabel;
@synthesize precipitationLabel;
@synthesize obstimeLabel;
@synthesize dataLabel;
- (void)viewDidLoad
{
	//初始化NSURL
	NSURL *url = [NSURL URLWithString:@"http://pcc.scqx.gov.cn/jfids/data/GridData.svt?sqlid=PhoneService.selectCurWeather1&areacode=510100000"];
	NSURL *url1= [NSURL URLWithString:@"http://pcc.scqx.gov.cn/jfids/data/GridData.svt?sqlid=PhoneService.selectCurWeather2&areacode=510100000"];
	
    NSString *post=@"postData";
	NSString *post1=@"postData";
	
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
	NSData *postData1 = [post1 dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
	
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
	NSMutableURLRequest *request1 = [NSMutableURLRequest requestWithURL:url1];
    [request setHTTPMethod:@"POST"];
	[request1 setHTTPMethod:@"POST"];
	
    [request setHTTPBody:postData];
	[request1 setHTTPBody:postData1];
	
    [request setTimeoutInterval:10.0];
	[request1 setTimeoutInterval:10.0];
	
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
	NSOperationQueue *queue1 = [[NSOperationQueue alloc]init];
	
	//url连接网络并处理数据
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:queue
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error){
                               if (error) {
								   //连接失败
                                   NSLog(@"Httperror:%@", error.localizedDescription);
                               }else{
								   
                                   //成功连接
                                   NSString *responseString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                                   NSLog(@"HttpResponseBody %@",responseString);
								   
								   //将NSString转NSArray并以逗号分组
								   NSArray *test=[responseString componentsSeparatedByString:@","];
								   NSLog(@"%@",test);
								   								  
								   //截取test并将其赋值给Label的文本
								   tempLabel.text=[[test objectAtIndex:6] substringFromIndex:7];
								   
								    windLabel.text=[[[test objectAtIndex:10] substringFromIndex:11] substringToIndex:2];
								   
								   windLabel1.text=[[[test objectAtIndex:1] substringFromIndex:22] substringToIndex:1];
								   
								   humidityLabel.text=[[test objectAtIndex:4] substringFromIndex:14];
								   
								   precipitationLabel.text=[[test objectAtIndex:3] substringFromIndex:16];
								   
								   dataLabel.text=[[[test objectAtIndex:8] substringFromIndex:11] substringToIndex:10];
								   
								   obstimeLabel.text=[[[test objectAtIndex:2] substringFromIndex:11] substringToIndex:2];
								   
								
									}
                           }];
	[NSURLConnection sendAsynchronousRequest:request1
									   queue:queue1
						   completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
							   if (connectionError) {
								   NSLog(@"Httperror:%@ %d", connectionError.localizedDescription);
							   }else{
								   
								   NSString *responseString1 = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                                   NSLog(@"HttpResponseBody %@",responseString1);
								   
								   
								   NSArray *test1=[responseString1 componentsSeparatedByString:@","];
								   NSLog(@"%@",test1);
								   
								   weatherLabel.text=[[[test1 objectAtIndex:4] substringFromIndex:15] substringToIndex:4];


							   
								   
							   }
						   }];
	    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
	
}

- (IBAction)pressedButton:(id)sender {
	
		
		
}

-(void)createWeatherData{

	
}

@end
