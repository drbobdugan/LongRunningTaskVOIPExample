//
//  ViewController.h
//  LongRunningTaskVOIPExample
//
//  Created by Bob Dugan on 11/6/15.
//  Copyright © 2015 Bob Dugan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <TwilioSDK/TwilioClient.h>
#import "BackgroundTimeRemainingUtility.h"

@interface ViewController : UIViewController <TCConnectionDelegate, TCDeviceDelegate>

@property (strong, atomic) TCDevice* phone;
@property (strong, atomic) TCConnection* connection;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumber;
- (IBAction)dialButtonPressed:(id)sender;
- (IBAction)hangupButtonPressed:(id)sender;

@end


