//
//  ScamsDSSchemaItem.m
//  AdventureGuard
//
//  This App has been generated using IBM Mobile UI Builder
//

#import "ScamsDSSchemaItem.h"
#import "NSDictionary+RO.h"

@implementation ScamsDSSchemaItem

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {

	self = [super init];
	if (self) {
		[self updateWithDictionary:dictionary];
	}
	return self;
}

- (void)updateWithDictionary:(NSDictionary *)dictionary {
    
    self.idProp = [dictionary ro_stringForKey:kScamsDSSchemaItemId];
    
    self.scam = [dictionary ro_numberForKey:kScamsDSSchemaItemScam];
    
    id location = [dictionary objectForKey:kScamsDSSchemaItemLocation];
    if ([location isKindOfClass:[NSDictionary class]]) {
    	self.location = [[RORestGeoPoint alloc] initWithDictionary:location];
    }
    
    self.report = [dictionary ro_dateForKey:kScamsDSSchemaItemReport];
    
    self.user = [dictionary ro_numberForKey:kScamsDSSchemaItemUser];
}

- (id)identifier {
	
	return self.idProp;
}

@end

