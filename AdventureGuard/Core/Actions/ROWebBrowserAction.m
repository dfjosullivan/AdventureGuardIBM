//
//  ROWebBrowserAction.m
//  AdventureGuard
//
//  This App has been generated using IBM Mobile UI Builder
//

#import "ROWebBrowserAction.h"
#import "UIImage+RO.h"
#import "ROUtils.h"

@implementation ROWebBrowserAction

- (id)initWithValue:(NSString *)urlString {
    
    NSString *url = @"";
    if (urlString) {
        url = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSRange prefixRange = [url rangeOfString:@"://"];
        if (prefixRange.location == NSNotFound) {
            url = [NSString stringWithFormat:@"http://%@", url];
        }
    }
    self = [super initWithUri:url
                       atIcon:[UIImage imageNamed:@"url"]];
    if (self) {

    }
    return self;
}

- (void)doAction {
    
    [super doAction];
    
    [[[ROUtils sharedInstance] analytics] logAction:@"Open link"
                                             target:self.uri];
}

@end
