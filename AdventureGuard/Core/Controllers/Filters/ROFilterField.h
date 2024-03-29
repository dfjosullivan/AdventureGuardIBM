//
//  ROFormField.h
//  AdventureGuard
//
//  This App has been generated using IBM Mobile UI Builder
//

#import <Foundation/Foundation.h>
#import "ROFilter.h"

@protocol ROFilterField <NSObject>

- (NSString *)fieldLabel;

- (NSString *)fieldName;

- (NSString *)fieldValue;

- (void)setFieldValue:(NSString *)fieldValue;

- (id<ROFilter>)filter;

- (NSInteger)numberOfRows;

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

@end
