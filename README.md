UIAlertController+Blocks
========================

Convenience methods for UIAlertController. The API follows the same pattern as [UIAlertView+Blocks](https://github.com/ryanmaxwell/UIAlertView-Blocks) and [UIActionSheet+Blocks](https://github.com/ryanmaxwell/UIActionSheet-Blocks)

Create and show an alert controller with a single call:

```objc
[UIAlertController showInViewController:self
                              withTitle:@"Test Alert"
                                message:@"Test Message"
                         preferredStyle:UIAlertControllerStyleAlert
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

Add `UIAlertView+Blocks.h/m` into your project, or `pod 'UIAlertView+Blocks', :git => 'https://github.com/ryanmaxwell/UIAlertController-Blocks'` using CocoaPods.