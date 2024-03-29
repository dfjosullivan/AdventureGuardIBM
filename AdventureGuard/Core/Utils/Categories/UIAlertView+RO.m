//
//  UIAlertView+RO.m
//  AdventureGuard
//
//  This App has been generated using IBM Mobile UI Builder
//

#import "UIAlertView+RO.h"

@implementation UIAlertView (RO)

+ (void)ro_showWithErrorMessage:(NSString *)message
{
    [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Error", nil)
                                message:message
                               delegate:nil
                      cancelButtonTitle:NSLocalizedString(@"Ok", nil)
                      otherButtonTitles:nil] show];
}

+ (void)ro_showWithInfoMessage:(NSString *)message
{
    [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Info", nil)
                                message:message
                               delegate:nil
                      cancelButtonTitle:NSLocalizedString(@"Ok", nil)
                      otherButtonTitles:nil] show];
}

@end