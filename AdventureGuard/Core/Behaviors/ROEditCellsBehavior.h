//
//  ROEditCellsBehavior.h
//  AdventureGuard
//
//  This App has been generated using IBM Mobile UI Builder
//

#import <Foundation/Foundation.h>
#import "ROBehavior.h"

@protocol RODataDelegate;

@class ROCollectionViewController;

@interface ROEditCellsBehavior : NSObject <ROBehavior, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) ROCollectionViewController<RODataDelegate, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout> *viewController;

- (instancetype)initWithViewController:(ROCollectionViewController<RODataDelegate, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout> *)viewController;

+ (instancetype)behaviorViewController:(ROCollectionViewController<RODataDelegate, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout> *)viewController;

@end
