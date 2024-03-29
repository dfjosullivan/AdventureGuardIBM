//
//  ROFacetimeAction.m
//  AdventureGuard
//
//  This App has been generated using IBM Mobile UI Builder
//

#import "ROFacetimeAction.h"

@implementation ROFacetimeAction

- (id)initWithValue:(NSString *)facetimeId
{
    NSMutableString *uri = [[NSMutableString alloc] initWithString:@"facetime:"];
    if (facetimeId) {
        [uri appendString:[facetimeId stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    }
    self = [super initWithUri:uri
                       atIcon:nil];
    if (self) {
        _facetimeId = facetimeId;
    }
    return self;
}

@end
