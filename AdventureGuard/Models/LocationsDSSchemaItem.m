//
//  LocationsDSSchemaItem.m
//  AdventureGuard
//
//  This App has been generated using IBM Mobile UI Builder
//

#import "LocationsDSSchemaItem.h"
#import "NSDictionary+RO.h"

@implementation LocationsDSSchemaItem

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {

	self = [super init];
	if (self) {
		[self updateWithDictionary:dictionary];
	}
	return self;
}

- (void)updateWithDictionary:(NSDictionary *)dictionary {
    
    self.idProp = [dictionary ro_stringForKey:kLocationsDSSchemaItemId];
    
    self.city = [dictionary ro_stringForKey:kLocationsDSSchemaItemCity];
    
    self.country = [dictionary ro_stringForKey:kLocationsDSSchemaItemCountry];
    
    self.picture = [dictionary ro_stringForKey:kLocationsDSSchemaItemPicture];
    
    self.customs = [dictionary ro_stringForKey:kLocationsDSSchemaItemCustoms];
    
    self.risks = [dictionary ro_stringForKey:kLocationsDSSchemaItemRisks];
}

- (id)identifier {
	
	return self.idProp;
}

@end

