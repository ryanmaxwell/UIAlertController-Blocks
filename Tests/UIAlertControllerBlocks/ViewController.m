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
                    popoverPresentationControllerBlock:^(UIPopoverPresentationController *popover){
                        popover.sourceView = self.view;
                        popover.sourceRect = sender.frame;
                    }
                                              tapBlock:self.tapBlock];
}

@end
