//
//  LocalInfoFormViewController.m
//  AdventureGuard
//
//  This App has been generated using IBM Mobile UI Builder
//

#import "DatasourceManager.h"
#import "LocalInfoFormViewController.h"
#import "LocationsDS.h"
#import "LocationsDSSchemaItem.h"
#import "ROError.h"
#import "RORefreshBehavior.h"
#import "ROUtils.h"
#import "SVProgressHUD.h"

@interface LocalInfoFormViewController () <UITextFieldDelegate, ROFormDataDelegate>


@end

@implementation LocalInfoFormViewController

- (instancetype)init {

    self = [super init];
    if (self) {

        self.formDataDelegate = self;
    }
    return self;
}

- (void) viewDidLoad {

    [super viewDidLoad];

    [[[ROUtils sharedInstance] analytics] logPage:@"LocalInfoForm"];

}

#pragma mark - Form data delegate

- (void)loadFormData:(LocationsDSSchemaItem *)item {

    self.identifier = [item identifier];

}

#pragma mark - Form actions

- (void)cancelButtonAction:(id)sender {

    [super cancelButtonAction:sender];
}

- (void)deleteButtonAction:(id)sender {

    [super deleteButtonAction:sender];
}

- (void)saveButtonAction:(id)sender {

    [super saveButtonAction:sender];
}

- (void)confirmDelete {

    [super confirmDelete];
}

- (void)deleteItem {

    [super deleteItem];
}

- (void)updateItem {

    [self.hiddenValues removeAllObjects];

    [super updateItem];
}

- (void)createItem {
    
    [super createItem];
}

@end

