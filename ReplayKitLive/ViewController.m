//
//  ViewController.m
//  ReplayKitLive
//
//  Created by Anirban Bhattacharya (Student) on 8/18/17.
//  Copyright © 2017 Anirban Bhattacharya (Student). All rights reserved.
//

#import "ViewController.h"
#import <ReplayKit/ReplayKit.h>
@interface ViewController ()<RPBroadcastActivityViewControllerDelegate>
{
    RPBroadcastActivityViewController *broadcastAVC;
    RPBroadcastController *broadcastC;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
}
- (IBAction)switchBroadcasting:(id)sender {
    [RPBroadcastActivityViewController loadBroadcastActivityViewControllerWithHandler:^(RPBroadcastActivityViewController * _Nullable broadcastActivityViewController, NSError * _Nullable error) {
        broadcastAVC=broadcastActivityViewController;
        broadcastAVC.delegate=self;
        [self presentViewController:broadcastAVC animated:YES completion:nil];
        }];
}

- (void)broadcastActivityViewController:(RPBroadcastActivityViewController *)broadcastActivityViewController didFinishWithBroadcastController:(nullable RPBroadcastController *)broadcastController error:(nullable NSError *)error {
    
    [broadcastAVC dismissViewControllerAnimated:YES completion:nil];
    
    broadcastC = broadcastController;
    [broadcastController startBroadcastWithHandler:^(NSError * _Nullable error) {
        if (!error) {
            [self.SwitchBroadcastButton setTitle:@"Stop broadcasting" forState:UIControlStateNormal];
        } else {
            NSLog(@"startBroadcastWithHandler error: %@", error);
        }
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
