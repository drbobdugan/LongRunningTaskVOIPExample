//
//  ViewController.m
//  LongRunningTaskVOIPExample
//

//
//  Created by Bob Dugan on 11/6/15.
//  Copyright © 2015 Bob Dugan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // Create Twilio token to use for access to Twilio server
    NSURL *url = [NSURL URLWithString:@"http://longrunningtaskviopexample.herokuapp.com/token"];
    NSError *error = nil;
    NSString *token = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&error];
    
    // Create a Twilio phone object for doing phone stuff
    if (token == nil) {
        NSLog(@"Error retrieving token: %@", [error localizedDescription]);
    } else {
        _phone = [[TCDevice alloc] initWithCapabilityToken:token delegate:self];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dialButtonPressed:(id)sender
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    _connection = [_phone connect:nil delegate:self];
}


- (IBAction)hangupButtonPressed:(id)sender
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    [_connection disconnect];
}

//////////////////////////////////////////////////////////
// TCDevice Delegate Methods
//////////////////////////////////////////////////////////

// Got an incoming call
- (void)device:(TCDevice *)device didReceiveIncomingConnection:(TCConnection *)connection
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    [BackgroundTimeRemainingUtility NSLog];
}

// Got a presence update
- (void)device:(TCDevice *)device didReceivePresenceUpdate:(TCPresenceEvent *)presenceEvent
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    [BackgroundTimeRemainingUtility NSLog];
}

// Stopped listenting for incoming call
- (void)device:(TCDevice *)device didStopListeningForIncomingConnections:(NSError *)error
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    [BackgroundTimeRemainingUtility NSLog];
}

// Listening for incoming call
- (void)deviceDidStartListeningForIncomingConnections:(TCDevice *)device
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    [BackgroundTimeRemainingUtility NSLog];
}

//////////////////////////////////////////////////////////
// TCConnection Delegate Methods
//////////////////////////////////////////////////////////

// Connection failed
- (void)connection:(TCConnection *)connection didFailWithError:(NSError *)error
{
     NSLog(@"%s", __PRETTY_FUNCTION__);
    [BackgroundTimeRemainingUtility NSLog];
}

// Connection was successful
- (void)connectionDidConnect:(TCConnection *)connection
{
     NSLog(@"%s", __PRETTY_FUNCTION__);
    [BackgroundTimeRemainingUtility NSLog];
}

// Connection attempt is being made
- (void)connectionDidStartConnecting:(TCConnection *)connection
{
     NSLog(@"%s", __PRETTY_FUNCTION__);
    [BackgroundTimeRemainingUtility NSLog];
}

// Connection was ended
- (void)connectionDidDisconnect:(TCConnection *)connection
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    [BackgroundTimeRemainingUtility NSLog];
}

@end
