//
//  ROListDataLoader.h
//  AdventureGuard
//
//  This App has been generated using IBM Mobile UI Builder
//

#import <Foundation/Foundation.h>
#import "RODataLoader.h"
#import "RODatasource.h"

@interface ROListDataLoader : NSObject<RODataLoader>

- (instancetype)initWithDatasource:(NSObject<RODatasource> *)datasource optionsFilter:(ROOptionsFilter *)optionsFilter;

/**
 Datasource
 */
@property (nonatomic, strong) NSObject<RODatasource> *datasource;

/**
 *  Datasource options filter
 */
@property (nonatomic, strong) ROOptionsFilter *optionsFilter;

@end
