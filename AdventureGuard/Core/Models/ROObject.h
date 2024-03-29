//
//  ROObject.h
//  AdventureGuard
//
//  This App has been generated using IBM Mobile UI Builder
//

#import <Foundation/Foundation.h>

/**
 Generic object.
 All objects extend it. Add common functionality to all objects.
 */
@interface ROObject : NSObject

/**
 Constructor with a dictionary
 @param attributes Init values
 @return Class instance
 */
- (id)initWithAttributes:(NSDictionary *)attributes;

/**
 Constructor with resource file name
 @param plistName Resource name
 @return Class instance
 */
- (id)initWithPlistName:(NSString *)plistName;

/**
 Constructor with default resource file name (class name)
 @return Class instance
 */
- (id)initWithDefaultResource;

/**
 Constructor with a dictionary
 @param attributes Init values
 @return Class instance
 */
+ (id)objectWithAttributes:(NSDictionary *)attributes;

@end
