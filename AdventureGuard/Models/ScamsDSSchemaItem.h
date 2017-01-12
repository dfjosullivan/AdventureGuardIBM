//
//  ScamsDSSchemaItem.h
//  AdventureGuard
//
//  This App has been generated using IBM Mobile UI Builder
//

#import <Foundation/Foundation.h>
#import "ROModel.h"
#import "RORestGeoPoint.h"
#import "ScamsDSSchemaItemKeys.h"

@interface ScamsDSSchemaItem : NSObject <ROModelDelegate>

@property (nonatomic, strong) NSString *idProp;

@property (nonatomic, strong) NSNumber *scam;

@property (nonatomic, strong) RORestGeoPoint *location;

@property (nonatomic, strong) NSDate *report;

@property (nonatomic, strong) NSNumber *user;

@end
