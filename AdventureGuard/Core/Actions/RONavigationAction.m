//
//  RONavigationAction.m
//  AdventureGuard
//
//  This App has been generated using IBM Mobile UI Builder
//

#import "RONavigationAction.h"
#import "UIImage+RO.h"
#import "UIViewController+Sliding.h"

@import ECSlidingViewController;

@implementation RONavigationAction

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController destinationValue:(id)destinationValue {

    self = [super init];
    if (self) {
        
        _rootViewController = rootViewController;
        
        if ([destinationValue isKindOfClass:[UIViewController class]]) {
            
            _destinationController = destinationValue;
            _destinationClass = [_destinationController class];
            
        } else {
            
            _destinationController = nil;
            _destinationClass = destinationValue;
        }
    }
    return self;
}

+ (instancetype)navigationActionWithRootViewController:(UIViewController *)rootViewController destinationValue:(id)destinationValue {
    
    return [[self alloc] initWithRootViewController:rootViewController
                                   destinationValue:destinationValue];
}

- (UIViewController *)destinationController {

    if (!_destinationController) {
        
        if (_destinationClass) {
            
            _destinationController = [_destinationClass new];
        }
    }
    return _destinationController;
}

- (void)doAction {
    
    if ([self canDoAction]) {
        
        if (self.destinationController) {
            
            [self navigateToViewController:self.destinationController];
        }
    }
}

- (BOOL)canDoAction {
    
    return self.rootViewController && self.destinationController && ![self.rootViewController isEqual:self.destinationController];
}

- (UIImage *)actionIcon {
    
    return [UIImage imageNamed:@"arrow"];
}

- (void)navigateToViewController:(UIViewController *)viewController {
    
    if ([self.rootViewController isKindOfClass:[ECSlidingViewController class]]) {
        
        ECSlidingViewController *slidingViewController = (ECSlidingViewController *)self.rootViewController;
        
        UINavigationController *navigationController = (UINavigationController *)slidingViewController.topViewController;
        
        [viewController ro_addLeftSlidingButton];
        
        [navigationController setViewControllers:@[self.destinationController]];
        [slidingViewController resetTopViewAnimated:YES onComplete:^{
            
            if ([viewController.toolbarItems count] == 0) {
            
                [viewController.navigationController setToolbarHidden:YES
                                                             animated:YES];
            }
        }];
        
    } else if ([self.rootViewController isKindOfClass:[UINavigationController class]]) {
    
        UINavigationController *navigationController = (UINavigationController *)self.rootViewController;
        if (![[navigationController topViewController] isEqual:viewController]) {
            
            [navigationController pushViewController:viewController
                                            animated:YES];
        }
        
    } else {
        
        UINavigationController *navigationController = self.rootViewController.navigationController;
        if (![[navigationController topViewController] isEqual:viewController]) {
            
            [navigationController pushViewController:viewController
                                            animated:YES];
        }
    }
}

@end
