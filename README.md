UIAlertController+Blocks
========================

Convenience methods for UIAlertController. The API follows the same pattern as [UIAlertView+Blocks](https://github.com/ryanmaxwell/UIAlertView-Blocks) and [UIActionSheet+Blocks](https://github.com/ryanmaxwell/UIActionSheet-Blocks)

Create and show an alert controller with a single call:

### Objective-C

```objc
[UIAlertController showAlertInViewController:self
                                   withTitle:@"Test Alert"
                                     message:@"Test Message"
                           cancelButtonTitle:@"Cancel"
                      destructiveButtonTitle:@"Delete"
                           otherButtonTitles:@[@"First Other", @"Second Other"]
                                    tapBlock:^(UIAlertController *controller, UIAlertAction *action, NSInteger buttonIndex){

                                         if (buttonIndex == controller.cancelButtonIndex) {
                                             NSLog(@"Cancel Tapped");
                                         } else if (buttonIndex == controller.destructiveButtonIndex) {
                                             NSLog(@"Delete Tapped");
                                         } else if (buttonIndex >= controller.firstOtherButtonIndex) {
                                             NSLog(@"Other Button Index %ld", (long)buttonIndex - controller.firstOtherButtonIndex);
                                         }
                                     }];
```

### Swift

```swift

UIAlertController.showAlertInViewController(self,
    withTitle: "Test Alert",
    message: "Test Message",
    cancelButtonTitle: "Cancel",
    destructiveButtonTitle: "Delete",
    otherButtonTitles: ["First Other", "Second Other"],
    tapBlock: {(controller, action, buttonIndex) in
    
        if (buttonIndex == controller.cancelButtonIndex) {
            println("Cancel Tapped")
        } else if (buttonIndex == controller.destructiveButtonIndex) {
            println("Delete Tapped")
        } else if (buttonIndex >= controller.firstOtherButtonIndex) {
            println("Other Button Index \(buttonIndex - controller.firstOtherButtonIndex)")
        }
    })
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
             popoverPresentationControllerBlock:(void(^)(UIPopoverPresentationController *popover))popoverPresentationControllerBlock
                                       tapBlock:(UIAlertControllerCompletionBlock)tapBlock;
```

## Requirements

Since version 0.9 the headers use the new Objective-C [nullability annotations](https://developer.apple.com/swift/blog/?id=25) for nicer interoperability with Swift, so you will need Xcode 6.3 or later to compile it.

## Usage

Add `UIAlertController+Blocks.h/m` into your project, or `pod 'UIAlertController+Blocks'` using CocoaPods.
In your code, either `#import <UIAlertController+Blocks/UIAlertController+Blocks.h>` (Objective-C header), `@import UIAlertController_Blocks;` (Objective-C module), or `import UIAlertController_Blocks` (Swift).

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
                                            if (buttonIndex == controller.destructiveButtonIndex) {
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