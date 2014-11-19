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
                                        tapBlock:^(UIAlertController *controller, UIAlertAction *action, NSInteger buttonIndex){
                                             
                                             if (buttonIndex == UIAlertControllerBlocksCancelButtonIndex) {
                                                 NSLog(@"Cancel Tapped");
                                             } else if (buttonIndex == UIAlertControllerBlocksDestructiveButtonIndex) {
                                                 NSLog(@"Delete Tapped");
                                             } else if (buttonIndex >= UIAlertControllerBlocksFirstOtherButtonIndex) {
                                                 NSLog(@"Other Button Index %ld", (long)buttonIndex - UIAlertControllerBlocksFirstOtherButtonIndex);
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
                                              tapBlock:^(UIAlertController *controller, UIAlertAction *action, NSInteger buttonIndex){
                                                 
                                                     if (buttonIndex == UIAlertControllerBlocksCancelButtonIndex) {
                                                         NSLog(@"Cancel Tapped");
                                                     } else if (buttonIndex == UIAlertControllerBlocksDestructiveButtonIndex) {
                                                         NSLog(@"Delete Tapped");
                                                     } else if (buttonIndex >= UIAlertControllerBlocksFirstOtherButtonIndex) {
                                                         NSLog(@"Other Action Index %ld", (long)buttonIndex - UIAlertControllerBlocksFirstOtherButtonIndex);
                                                     }
                                              }];
}

@end
