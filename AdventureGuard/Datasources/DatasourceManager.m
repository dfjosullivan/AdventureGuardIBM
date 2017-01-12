//
//  DatasourceManager.m
//  AdventureGuard
//
//  This App has been generated using IBM Mobile UI Builder
//

#import "DatasourceManager.h"
#import "LocationsDS.h"
#import "ScamsDS.h"
#import "EmptyDatasource.h"

@implementation DatasourceManager

+ (instancetype)sharedInstance {

    static id _sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{

        _sharedInstance = [[self alloc] init];
    });
    return _sharedInstance;
}

#pragma mark - Properties init

- (LocationsDS *)locationsDS {

    if (!_locationsDS) {

        _locationsDS = [LocationsDS new];
    }
    return _locationsDS;
}

- (ScamsDS *)scamsDS {

    if (!_scamsDS) {

        _scamsDS = [ScamsDS new];
    }
    return _scamsDS;
}

- (EmptyDatasource *)emptyDatasource {

    if (!_emptyDatasource) {

        _emptyDatasource = [EmptyDatasource new];
    }
    return _emptyDatasource;
}

#pragma mark - Public methods

- (void)sync {

    
}

@end

