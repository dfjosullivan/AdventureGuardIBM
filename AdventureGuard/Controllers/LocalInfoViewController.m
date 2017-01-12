//
//  LocalInfoViewController.m
//  AdventureGuard
//
//  This App has been generated using IBM Mobile UI Builder
//

#import "DatasourceManager.h"
#import "LocalInfoDetailViewController.h"
#import "LocalInfoFormViewController.h"
#import "LocalInfoViewController.h"
#import "LocationsDS.h"
#import "LocationsDSSchemaItem.h"
#import "ROCreateItemBehavior.h"
#import "ROEditRowsBehavior.h"
#import "ROListDataLoader.h"
#import "RONavigationAction.h"
#import "ROOptionsFilter.h"
#import "RORefreshBehavior.h"
#import "ROStyle.h"
#import "ROTableViewCell.h"
#import "ROTextStyle.h"
#import "ROUtils.h"
#import "UIImage+RO.h"
#import "UIImageView+RO.h"
#import "UILabel+RO.h"

@interface LocalInfoViewController ()

@property (nonatomic, strong) ROOptionsFilter *optionsFilter;

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;

@end

@implementation LocalInfoViewController

static NSString * const kReuseIdentifier = @"Cell";

- (instancetype)init {

    self = [super init];
    if (self) {

        self.dataLoader = [[ROListDataLoader alloc] initWithDatasource:[[DatasourceManager sharedInstance] locationsDS]
                                                         optionsFilter:self.optionsFilter];
    }
    return self;
}

- (void)viewDidLoad {

    [super viewDidLoad];

    [[[ROUtils sharedInstance] analytics] logPage:@"LocalInfo"];

    self.navigationItem.title = NSLocalizedString(@"Local Info", nil);

    self.tableView.dataSource = self;
    self.tableView.delegate = self;

    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.tableView setLayoutMargins:UIEdgeInsetsZero];
    }
    if([self.tableView respondsToSelector:@selector(setCellLayoutMarginsFollowReadableWidth:)]) {
        self.tableView.cellLayoutMarginsFollowReadableWidth = NO;
    }
    
    [self.behaviors addObject:[ROCreateItemBehavior behaviorViewController:self crudControllerClass:[LocalInfoFormViewController class]]];
    [self.behaviors addObject:[ROEditRowsBehavior behaviorViewController:self]];
    [self.behaviors addObject:[RORefreshBehavior behaviorViewController:self]];

    for (id<ROBehavior> behavior in self.behaviors) {
        [behavior viewDidLoad];
    }

    [self updateViewConstraints];

    [self loadData];
}

#pragma mark - Properties init

- (ROOptionsFilter *)optionsFilter {

    if (!_optionsFilter) {

        _optionsFilter = [ROOptionsFilter new];
        _optionsFilter.sortColumn = kLocationsDSSchemaItemCity;
        _optionsFilter.sortAscending = YES;
    }
    return _optionsFilter;
}

#pragma mark - Data delegate

- (void)loadData {

    [super loadData];
}

- (void)loadDataSuccess:(id)dataObject {

    [super loadDataSuccess:dataObject];
}

- (void)loadDataError:(ROError *)error {

    [super loadDataError:error];
}

#pragma mark - Private methods

- (void)configureCell:(ROTableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {

    LocationsDSSchemaItem *item = self.items[(NSUInteger)indexPath.row];
    [cell.photoImageView ro_setImage:item.picture imageError:[[ROStyle sharedInstance] noPhotoImage]];
    cell.titleLabel.text = item.city;
}

#pragma mark - <UITableViewDataSource>

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    ROTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kReuseIdentifier];
    if (cell == nil) {

        cell = [[ROTableViewCell alloc] initWithROStyle:ROTableViewCellStylePhotoTitle
                                        reuseIdentifier:kReuseIdentifier];

        [cell.titleLabel ro_style:[ROTextStyle style:ROFontSizeStyleMedium
                                                bold:NO
                                              italic:NO
                                        textAligment:NSTextAlignmentLeft]];

        // You can customize the accessory icon ...
        UIImage *accessoryImage = [[UIImage imageNamed:@"arrow"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        UIImageView *accessoryImageView = [[UIImageView alloc] initWithImage:accessoryImage];
        accessoryImageView.tintColor = [[ROStyle sharedInstance] accentColor];
        cell.accessoryView = accessoryImageView;
    }
    cell.backgroundColor = [UIColor clearColor];

    [self configureCell:cell atIndexPath:indexPath];

    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [self.items count];
}

#pragma mark - <UITableViewDelegate>

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {

    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        cell.preservesSuperviewLayoutMargins = NO;
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]){
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    LocationsDSSchemaItem *item = self.items[(NSUInteger)indexPath.row];
    LocalInfoDetailViewController *destinationViewController = [LocalInfoDetailViewController new];
    destinationViewController.item = item;
	destinationViewController.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:destinationViewController
                                         animated:YES];
}

@end

