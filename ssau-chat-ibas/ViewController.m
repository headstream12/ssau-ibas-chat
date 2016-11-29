//
//  ViewController.m
//  ssau-chat-ibas
//
//  Created by Ilya Glazunov on 20.11.16.
//  Copyright © 2016 Ilya Glazunov. All rights reserved.
//

#import "ViewController.h"
#import <SocketRocket/SocketRocket.h>


@interface ViewController () <SRWebSocketDelegate>

@property (strong, nonatomic) SRWebSocket *mainSocket;
@property (strong, nonatomic) SocketIO *socket;


@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    SocketIO *socketIO = [[SocketIO alloc] initWithDelegate:self];
    self.socket = socketIO;
}

- (void)viewWillAppear:(BOOL)animated
{
    [self setupSockets];
 

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupSockets
{
//    NSURL *url = [NSURL URLWithString:@"ws://localhost:9000"];
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    
//    SRWebSocket *rusSocket = [[SRWebSocket alloc] initWithURLRequest:request];
//    rusSocket.delegate = self;
//    [rusSocket open];
//    self.mainSocket = rusSocket;

}
- (IBAction)connectAction:(id)sender {
    
    [self.socket connectToHost:@"localhost" onPort:9000];
}

- (IBAction)sendMessage:(id)sender {
    [self.socket sendMessage:@"hello world"];
}

- (void)webSocket:(SRWebSocket *)webSocket didReceiveMessage:(id)message
{
    message = [[message stringByReplacingOccurrencesOfString:@"///" withString:@""] stringByReplacingOccurrencesOfString:@"\\\\\\" withString:@""];
}

- (void)webSocketDidOpen:(SRWebSocket *)webSocket
{
    NSString *helloMsg = @"{1}";
    [webSocket send:helloMsg];
}
- (IBAction)sendMessageAction:(UIButton *)sender
{
    NSString *helloMsg = @"{1}";
    [self.mainSocket send:helloMsg];
}

@end
