//
//  ROCreateBehavior.h
//  AdventureGuard
//
//  This App has been generated using IBM Mobile UI Builder
//

#import <Foundation/Foundation.h>
#import "ROBehavior.h"

@protocol RODataDelegate;

@interface ROCreateItemBehavior : NSObject <ROBehavior>

@property (nonatomic, strong) Class crudControllerClass;

@property (nonatomic, strong) UIViewController<RODataDelegate> *viewController;

- (instancetype)initWithViewController:(UIViewController<RODataDelegate> *)viewController crudControllerClass:(__unsafe_unretained Class)crudControllerClass;

+ (instancetype)behaviorViewController:(UIViewController<RODataDelegate> *)viewController crudControllerClass:(__unsafe_unretained Class)crudControllerClass;

@end
