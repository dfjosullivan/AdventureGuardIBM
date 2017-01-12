//
//  DatasourceManager.h
//  AdventureGuard
//
//  This App has been generated using IBM Mobile UI Builder
//

#import <Foundation/Foundation.h>

@class LocationsDS;
@class ScamsDS;
@class EmptyDatasource;

@interface DatasourceManager : NSObject

@property (nonatomic, strong) LocationsDS *locationsDS;

@property (nonatomic, strong) ScamsDS *scamsDS;

@property (nonatomic, strong) EmptyDatasource *emptyDatasource;

/**
 Singleton
 @return Class instance
 */
+ (instancetype)sharedInstance;

/**
 Synchronize all datasource
 */
- (void)sync;

@end

