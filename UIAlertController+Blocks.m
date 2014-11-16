//
//  UIAlertController+Blocks.m
//  UIAlertControllerBlocks
//
//  Created by Ryan Maxwell on 11/09/14.
//  Copyright (c) 2014 Ryan Maxwell. All rights reserved.
//

#import "UIAlertController+Blocks.h"

NSInteger const UIAlertControllerCancelActionIndex = 0;
NSInteger const UIAlertControllerDestructiveActionIndex = 1;
NSInteger const UIAlertControllerFirstOtherActionIndex = 2;

@implementation UIAlertController (Blocks)

+ (instancetype)alertControllerWithTitle:(NSString *)title
                                 message:(NSString *)message
                          preferredStyle:(UIAlertControllerStyle)preferredStyle
                       cancelButtonTitle:(NSString *)cancelButtonTitle
                  destructiveButtonTitle:(NSString *)destructiveButtonTitle
                       otherButtonTitles:(NSArray *)otherButtonTitles
                                tapBlock:(UIAlertControllerCompletionBlock)tapBlock
{
    UIAlertController *controller = [self alertControllerWithTitle:title
                                                           message:message
                                                    preferredStyle:preferredStyle];
    
    if (cancelButtonTitle) {
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle
                                                               style:UIAlertActionStyleCancel
                                                             handler:^(UIAlertAction *action){
                                                                 if (tapBlock) {
                                                                     tapBlock(controller, action, UIAlertControllerCancelActionIndex);
                                                                 }
                                                             }];
        [controller addAction:cancelAction];
    }
    
    if (destructiveButtonTitle) {
        UIAlertAction *destructiveAction = [UIAlertAction actionWithTitle:destructiveButtonTitle
                                                                    style:UIAlertActionStyleDestructive
                                                                  handler:^(UIAlertAction *action){
                                                                      if (tapBlock) {
                                                                          tapBlock(controller, action, UIAlertControllerDestructiveActionIndex);
                                                                      }
                                                                  }];
        [controller addAction:destructiveAction];
    }
    
    for (NSUInteger i = 0; i < otherButtonTitles.count; i++) {
        NSString *otherButtonTitle = otherButtonTitles[i];
        
        UIAlertAction *otherAction = [UIAlertAction actionWithTitle:otherButtonTitle
                                                              style:UIAlertActionStyleDefault
                                                            handler:^(UIAlertAction *action){
                                                                if (tapBlock) {
                                                                    tapBlock(controller, action, UIAlertControllerFirstOtherActionIndex + i);
                                                                }
                                                            }];
        [controller addAction:otherAction];
    }
    
    return controller;
}

+ (instancetype)alertWithTitle:(NSString *)title
                       message:(NSString *)message
             cancelButtonTitle:(NSString *)cancelButtonTitle
        destructiveButtonTitle:(NSString *)destructiveButtonTitle
             otherButtonTitles:(NSArray *)otherButtonTitles
                      tapBlock:(UIAlertControllerCompletionBlock)tapBlock
{
    return [self alertControllerWithTitle:title
                                  message:message
                           preferredStyle:UIAlertControllerStyleAlert
                        cancelButtonTitle:cancelButtonTitle
                   destructiveButtonTitle:destructiveButtonTitle
                        otherButtonTitles:otherButtonTitles
                                 tapBlock:tapBlock];
}

+ (instancetype)actionSheetWithTitle:(NSString *)title
                             message:(NSString *)message
                   cancelButtonTitle:(NSString *)cancelButtonTitle
              destructiveButtonTitle:(NSString *)destructiveButtonTitle
                   otherButtonTitles:(NSArray *)otherButtonTitles
                            tapBlock:(UIAlertControllerCompletionBlock)tapBlock
{
    return [self alertControllerWithTitle:title
                                  message:message
                           preferredStyle:UIAlertControllerStyleActionSheet
                        cancelButtonTitle:cancelButtonTitle
                   destructiveButtonTitle:destructiveButtonTitle
                        otherButtonTitles:otherButtonTitles
                                 tapBlock:tapBlock];
}

@end
