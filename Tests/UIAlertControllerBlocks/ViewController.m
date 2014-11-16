//
//  ViewController.m
//  UIAlertControllerBlocks
//
//  Created by Ryan Maxwell on 11/09/14.
//  Copyright (c) 2014 Ryan Maxwell. All rights reserved.
//

#import "ViewController.h"
#import "UIAlertController+Blocks.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showAlert:(id)sender
{
    [UIAlertController showAlertInViewController:self
                                       withTitle:@"Test Alert"
                                         message:@"Test Message"
                               cancelButtonTitle:@"Cancel"
                          destructiveButtonTitle:@"Delete"
                               otherButtonTitles:@[@"First Other", @"Second Other"]
                                        tapBlock:^(UIAlertController *controller, UIAlertAction *action, NSInteger actionIndex){
                                             
                                             if (actionIndex == UIAlertControllerCancelActionIndex) {
                                                 NSLog(@"Cancel Tapped");
                                             } else if (actionIndex == UIAlertControllerDestructiveActionIndex) {
                                                 NSLog(@"Delete Tapped");
                                             } else if (actionIndex >= UIAlertControllerFirstOtherActionIndex) {
                                                 NSLog(@"Other Action Index %ld", (long)actionIndex - UIAlertControllerFirstOtherActionIndex);
                                             }
                                         }];
}

- (IBAction)showActionSheet:(id)sender
{
    [UIAlertController showActionSheetInViewController:self
                                             withTitle:@"Test Action Sheet"
                                               message:@"Test Message"
                                     cancelButtonTitle:@"Cancel"
                                destructiveButtonTitle:@"Delete"
                                     otherButtonTitles:@[@"First Other", @"Second Other"]
                                              tapBlock:^(UIAlertController *controller, UIAlertAction *action, NSInteger actionIndex){
                                                 
                                                     if (actionIndex == UIAlertControllerCancelActionIndex) {
                                                         NSLog(@"Cancel Tapped");
                                                     } else if (actionIndex == UIAlertControllerDestructiveActionIndex) {
                                                         NSLog(@"Delete Tapped");
                                                     } else if (actionIndex >= UIAlertControllerFirstOtherActionIndex) {
                                                         NSLog(@"Other Action Index %ld", (long)actionIndex - UIAlertControllerFirstOtherActionIndex);
                                                     }
                                              }];
}

@end
