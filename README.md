UIAlertController+Blocks
========================

Convenience methods for UIAlertController. The API follows the same pattern as [UIAlertView+Blocks](https://github.com/ryanmaxwell/UIAlertView-Blocks) and [UIActionSheet+Blocks](https://github.com/ryanmaxwell/UIActionSheet-Blocks)

Create and show an alert controller with a single call:

```objc
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
```

Explicitly create alerts or action sheets with

```objc
+ (instancetype)showAlertInViewController:(UIViewController *)viewController
                                withTitle:(NSString *)title
                                  message:(NSString *)message
                        cancelButtonTitle:(NSString *)cancelButtonTitle
                   destructiveButtonTitle:(NSString *)destructiveButtonTitle
                        otherButtonTitles:(NSArray *)otherButtonTitles
                                 tapBlock:(UIAlertControllerCompletionBlock)tapBlock;
```

and 

```objc
+ (instancetype)showActionSheetInViewController:(UIViewController *)viewController
                                      withTitle:(NSString *)title
                                        message:(NSString *)message
                              cancelButtonTitle:(NSString *)cancelButtonTitle
                         destructiveButtonTitle:(NSString *)destructiveButtonTitle
                              otherButtonTitles:(NSArray *)otherButtonTitles
                                       tapBlock:(UIAlertControllerCompletionBlock)tapBlock;
```

## Usage

Add `UIAlertController+Blocks.h/m` into your project, or `pod 'UIAlertController+Blocks'` using CocoaPods.

## Supporting < iOS 8

You can add this pod to your project, along with 'UIAlertView+Blocks' or 'UIActionSheet+Blocks', and as long as you build with the iOS 8 SDK or greater, instantiate the appropriate class at runtime. e.g.

```objc

void(^deleteSalesOrderBlock)(void) = ^{
    /* Delete the sales order here */
};

if ([UIAlertController class]) {
    
    /* UIAlertController is preferable on >= iOS 8, as the destructive button will be in red */
    
    [UIAlertController showAlertInViewController:self
                                       withTitle:NSLocalizedString(@"AlertTitleDeleteSalesOrder", nil)
                                         message:NSLocalizedString(@"AlertMessageDeleteSalesOrder", nil)
                               cancelButtonTitle:NSLocalizedString(@"AlertButtonTitleCancel", nil)
                          destructiveButtonTitle:NSLocalizedString(@"AlertButtonTitleDelete", nil)
                               otherButtonTitles:nil
                                        tapBlock:^(UIAlertController *controller, UIAlertAction *action, NSInteger buttonIndex){
                                            if (buttonIndex == UIAlertControllerBlocksDestructiveButtonIndex) {
                                                deleteSalesOrderBlock();
                                            }
                                        }];
    
    
} else {
    [UIAlertView showWithTitle:NSLocalizedString(@"AlertTitleDeleteSalesOrder", nil)
                       message:NSLocalizedString(@"AlertMessageDeleteSalesOrder", nil)
             cancelButtonTitle:NSLocalizedString(@"AlertButtonTitleCancel", nil)
             otherButtonTitles:@[NSLocalizedString(@"AlertButtonTitleDelete", nil)]
                      tapBlock:^(UIAlertView *alertView, NSInteger buttonIndex){
                          if (buttonIndex == alertView.firstOtherButtonIndex) {
                              deleteSalesOrderBlock();
                          }
                      }];
}

```

I have also created the wrapper class [RMUniversalAlert](https://github.com/ryanmaxwell/RMUniversalAlert) which can do the above automatically for you.