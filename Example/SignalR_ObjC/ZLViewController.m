//
//  ZLViewController.m
//  SignalR_ObjC
//
//  Created by Faithlight on 05/06/2020.
//  Copyright (c) 2020 Faithlight. All rights reserved.
//

#import "ZLViewController.h"
#import "SignalR.h"
#import "SRVersion.h"
#import "SRWebSocketTransport.h"

@interface ZLViewController ()
@property (nonatomic,strong)SRHubProxy *hubProxy;
@end

@implementation ZLViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"send" style:UIBarButtonItemStyleDone target:self action:@selector(sendMessage)];
}
- (void)signalr1
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"tag"] = @"0";
    parameters[@"appid"] = @"00c90442c2a3446d89eb80744bf88f73";
    parameters[@"senderId"] = @"753184bceda74742873ea4c58fbfad4c"; //待获取
    parameters[@"dialogId"] = @"f8a2aeeb3f2640f7bdf3d33130e1c64e"; //待获取
//    parameters[@"serviceType"] = @"1";
//    parameters[@"tid"] = @"0";
//    parameters[@"_"] = [NSNumber numberWithLongLong:(long long)[[NSDate date] timeIntervalSince1970] * 1000];
 
    // Create a proxy to the chat service

}



- (void)signalr2
{
    NSString *userToken = @"fd34c8a52a734caf97ae3ff0c7530ae5";
    __block NSString *userCheckSign;
    
    SRHubConnection *connection = [[SRHubConnection alloc] initWithURLString:@"http://imservice.dd373.com/cors" queryString:@{@"userToken":userToken} useDefault:NO];
    connection.protocol = [[SRVersion alloc] initWithMajor:1 minor:5];
    self.hubProxy = [connection createHubProxy:@"chathub"];
//    [hubProxy on:@"addMsg" perform:self selector:@selector(addMessage:)];
    
    __weak __typeof(self)weakSelf = self;
    connection.started = ^{
        [weakSelf.hubProxy invoke:@"getUserCheckSign" withArgs:@[userToken] completionHandler:^(id response, NSError *error) {
            if (!error) {
                userCheckSign = response;
                
            }
        }];
    };
    SRWebSocketTransport *transport = [[SRWebSocketTransport alloc] init];
    [connection start:transport];
}


- (void)addMessage:(NSString *)message
{
    NSLog(@"proxy received message");
}

@end
