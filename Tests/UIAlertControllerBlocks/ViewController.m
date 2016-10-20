//
//  ViewController.m
//  UIAlertControllerBlocks
//
//  Created by Ryan Maxwell on 11/09/14.
//  Copyright (c) 2014 Ryan Maxwell. All rights reserved.
//

#import "ViewController.h"
#import "UIAlertController+Blocks.h"
#import "SecondViewController.h"

@interface ViewController ()

@property (strong, nonatomic) UIAlertControllerCompletionBlock tapBlock;

@end

@implementation ViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.tapBlock = ^(UIAlertController *controller, UIAlertAction *action, NSInteger buttonIndex){
            if (buttonIndex == controller.destructiveButtonIndex) {
                NSLog(@"Delete");
            } else if (buttonIndex == controller.cancelButtonIndex) {
                NSLog(@"Cancel");
            } else if (buttonIndex >= controller.firstOtherButtonIndex) {
                NSLog(@"Other %ld", (long)buttonIndex - controller.firstOtherButtonIndex + 1);
            }
        };
    }
    return self;
}

- (IBAction)showAlert:(id)sender
{
    [UIAlertController showAlertInViewController:self
                                       withTitle:@"Test Alert"
                                         message:@"Test Message"
                               cancelButtonTitle:@"Cancel"
                          destructiveButtonTitle:@"Delete"
                               otherButtonTitles:@[@"First Other", @"Second Other"]
                                        tapBlock:self.tapBlock];
}

- (IBAction)showActionSheet:(UIButton *)sender
{
    [UIAlertController showActionSheetInViewController:self
                                             withTitle:@"Test Action Sheet"
                                               message:@"Test Message"
                                     cancelButtonTitle:@"Cancel"
                                destructiveButtonTitle:@"Delete"
                                     otherButtonTitles:@[@"First Other", @"Second Other"]
#if TARGET_OS_IOS
                    popoverPresentationControllerBlock:^(UIPopoverPresentationController *popover){

                        popover.sourceView = self.view;
                        popover.sourceRect = sender.frame;
                    }
#endif
                                              tapBlock:self.tapBlock];
}

- (IBAction)showAlertOverPresentedViewController
{
    UIViewController *vc2 = [SecondViewController new];
    [self presentViewController:vc2 animated:YES completion:^{
        UIViewController *vc3 = [ThirdViewController new];
        [vc2 presentViewController:vc3 animated:YES completion:^{
            
            [UIAlertController showAlertInViewController:self
                                               withTitle:@"Test Alert"
                                                 message:@"Test Message"
                                       cancelButtonTitle:@"OK"
                                  destructiveButtonTitle:nil
                                       otherButtonTitles:nil
                                                tapBlock:^(UIAlertController *controller, UIAlertAction *action, NSInteger buttonIndex){
                                                    [self dismissViewControllerAnimated:YES completion:^{
                                                        [self dismissViewControllerAnimated:YES completion:nil];
                                                    }];
                                                }];
        }];
        
    }];
}


@end
