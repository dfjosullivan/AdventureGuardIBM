//
//  ROMapSearchAction.h
//  AdventureGuard
//
//  This App has been generated using IBM Mobile UI Builder
//

#import "ROMapAction.h"

/**
 Open map with search location
 */
@interface ROMapSearchAction : ROMapAction

/**
 Search location
 */
@property (nonatomic, strong) NSString *location;

/**
 Constructor with location
 @param location Location search
 @return Class instance
 */
- (id)initWithValue:(NSString *)location;


@end
