//
//  ROOptionsViewController.m
//  AdventureGuard
//
//  This App has been generated using IBM Mobile UI Builder
//

#import "ROOptionsViewController.h"
#import "ROFilterFieldSelection.h"
#import "ROStyle.h"
#import "NSString+RO.h"
#import "NSNumber+RO.h"
#import "ROOptionsFilter.h"

@import SVProgressHUD;

@interface ROOptionsViewController ()

@property (nonatomic, strong) NSArray *allOptions;

@property (nonatomic, strong) NSMutableArray *optionsSelected;

@property (nonatomic, assign) BOOL didUpdateConstraints;

@property (nonatomic, strong) NSMutableArray *mainConstraints;

- (void)doSelection;

- (void)configureInsets;

@end

@implementation ROOptionsViewController

static NSString *const kCellDefault = @"cellDefault";

static float const kSearchBarHeight = 44.0;

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    if (!self.formFieldSelection.single) {
        
        UIBarButtonItem *selectionItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                                       target:self
                                                                                       action:@selector(doSelection)];
        self.navigationItem.rightBarButtonItem = selectionItem;
    }
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    self.searchBar.delegate = self;
    
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.searchBar];
    
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.tableView setLayoutMargins:UIEdgeInsetsZero];
    }
    if([self.tableView respondsToSelector:@selector(setCellLayoutMarginsFollowReadableWidth:)]) {
        self.tableView.cellLayoutMarginsFollowReadableWidth = NO;
    }
    
    [self updateViewConstraints];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(configureInsets)
                                                 name:UIDeviceOrientationDidChangeNotification
                                               object:nil];
    
    [self configureInsets];
    
    [self loadData];
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    self.optionsSelected = self.formFieldSelection.optionsSelected ? [self.formFieldSelection.optionsSelected mutableCopy] : [NSMutableArray new];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    if (_tableView) {
        
        if (_tableView.superview) {
            
            [_tableView removeFromSuperview];
        }
        _tableView = nil;
    }
}

- (void)updateViewConstraints {
    
    if (!_didUpdateConstraints) {
        _didUpdateConstraints = YES;
        [self setupConstraints];
    }
    [super updateViewConstraints];
}

#pragma mark - Properties initialization

- (UITableView *)tableView {
    
    if (!_tableView) {
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.userInteractionEnabled = YES;
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.backgroundView = nil;
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        _tableView.tintColor = [[ROStyle sharedInstance] accentColor];
        _tableView.separatorColor = [[[ROStyle sharedInstance] accentColor] colorWithAlphaComponent:0.5f];
    }
    return _tableView;
}

- (UISearchBar *)searchBar {
    
    if (!_searchBar) {
        _searchBar = [[UISearchBar alloc] initWithFrame:CGRectZero];
        _searchBar.autocorrectionType = UITextAutocorrectionTypeNo;
        _searchBar.tintColor = [[ROStyle sharedInstance] applicationBarTextColor];
        _searchBar.barTintColor = [[ROStyle sharedInstance] applicationBarBackgroundColor];
        
        // Hide clear button
        NSArray *subviews = _searchBar.subviews.count == 1 ? [_searchBar.subviews.firstObject subviews] : _searchBar.subviews;
        for (id view in subviews) {
            if ([view isKindOfClass:[UITextField class]]) {
                UITextField *textField = (UITextField *)view;
                textField.clearButtonMode = UITextFieldViewModeNever;
                break;
            }
        }
    }
    return _searchBar;
}

- (NSMutableArray *)mainConstraints {
    
    if (!_mainConstraints) {
        
        _mainConstraints = [NSMutableArray new];
    }
    return _mainConstraints;
}

#pragma mark - Public methods

- (void)setupConstraints {
    
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    self.searchBar.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view removeConstraints:self.mainConstraints];
    
    NSDictionary *viewsBindings = @{
                                    @"topGuide": self.topLayoutGuide,
                                    @"searchBar": self.searchBar,
                                    @"tableView": self.tableView,
                                    };
    
    NSDictionary *metrics = @{
                              @"top": @([self.topLayoutGuide length]),
                              @"searchBarHeight": @(kSearchBarHeight)
                              };
    
    [self.mainConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[tableView]|"
                                                                                      options:NSLayoutFormatAlignAllTrailing
                                                                                      metrics:metrics
                                                                                        views:viewsBindings]];
    
    [self.mainConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[tableView]|"
                                                                                      options:NSLayoutFormatAlignAllTrailing
                                                                                      metrics:metrics
                                                                                        views:viewsBindings]];
    
    [self.mainConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[searchBar]|"
                                                                                      options:NSLayoutFormatAlignAllTrailing
                                                                                      metrics:metrics
                                                                                        views:viewsBindings]];
   
    [self.mainConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[topGuide][searchBar(searchBarHeight)]"
                                                                                      options:NSLayoutFormatAlignAllTrailing
                                                                                      metrics:metrics
                                                                                        views:viewsBindings]];
    
    [self.view addConstraints:self.mainConstraints];
}

- (void)loadData {
    
    [SVProgressHUD show];
    [self.formFieldSelection.datasource distinctValues:self.formFieldSelection.fieldName filters:self.dataLoader.optionsFilter.designFilters onSuccess:^(NSArray *objects) {
        
        self.allOptions = objects;
        self.formFieldSelection.options = objects;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [self.tableView reloadData];
            
        });
        [SVProgressHUD dismiss];
        
    } onFailure:^(NSError *error, NSHTTPURLResponse *response) {
        
        [SVProgressHUD showErrorWithStatus:NSLocalizedString(@"Load data error", nil)];
        
    }];
}

#pragma mark - Private methods

- (void)doSelection {
    
    if ([self.optionsSelected count] != 0) {
        self.formFieldSelection.optionsSelected = [self.optionsSelected mutableCopy];
    } else {
        self.formFieldSelection.optionsSelected = nil;
    }
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)configureInsets {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        float top = [self.topLayoutGuide length];
        UIEdgeInsets scrollInstes = self.tableView.contentInset;
        scrollInstes.top = top + kSearchBarHeight;
        self.tableView.contentInset = scrollInstes;
        
    });
}

#pragma mark - <UITableViewDataSource>

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellDefault];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellDefault];
        
        UIView *selectecedView = [[UIView alloc] init];
        selectecedView.backgroundColor = [[ROStyle sharedInstance] selectedColor];
        cell.selectedBackgroundView = selectecedView;
        
        cell.backgroundColor = [UIColor clearColor];
        cell.textLabel.font = [[ROStyle sharedInstance] font];
        cell.textLabel.textColor = [[ROStyle sharedInstance] foregroundColor];
    }
    
    NSString *option;
    
    id optionRow = [self.formFieldSelection.options objectAtIndex:indexPath.row];
    
    if ([optionRow respondsToSelector:@selector(ro_stringValue)]) {
        
        option = [optionRow ro_stringValue];
        
    } else if ([optionRow respondsToSelector:@selector(stringValue)]) {
        
        option = [optionRow stringValue];
        
    } else {
        
        option = [optionRow description];
    }
    
    cell.textLabel.text = option;
    if ([self.optionsSelected containsObject:[option description]]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.formFieldSelection.options count];
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
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    NSString *option;
    
    id optionRow = [self.formFieldSelection.options objectAtIndex:indexPath.row];
    
    if ([optionRow respondsToSelector:@selector(ro_stringValue)]) {
        
        option = [optionRow ro_stringValue];
        
    } else if ([optionRow respondsToSelector:@selector(stringValue)]) {
        
        option = [optionRow stringValue];
        
    } else {
        
        option = [optionRow description];
    }
    
    if (self.formFieldSelection.single) {
        
        BOOL add = YES;
        if ([self.optionsSelected containsObject:[option description]]) {
            add = NO;
        }
        [self.optionsSelected removeAllObjects];
        if (add) {
            [self.optionsSelected addObject:option];
        }
        
        [self doSelection];
        
    } else {
        
        if ([self.optionsSelected containsObject:option]) {
            [self.optionsSelected removeObject:option];
        } else {
            [self.optionsSelected addObject:option];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [tableView beginUpdates];
            [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
            [tableView endUpdates];
            
        });
        
    }
}

#pragma mark - Search bar delegate

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    
    if (!searchBar.showsCancelButton) {
        [searchBar setShowsCancelButton:YES animated:YES];
    }
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
    
    if (searchBar.showsCancelButton) {
        [searchBar setShowsCancelButton:NO animated:YES];
    }
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    
    if (searchBar.text && [[searchBar.text ro_trim] length] != 0) {
        [self searchBy:searchBar.text];
    } else {
        [self searchBy:nil];
    }
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    
    searchBar.text = nil;
    [self searchBy:nil];
}

- (void)searchBy:(NSString *)searchText {
    
    [self.view endEditing:YES];
    if (!searchText) {
        self.formFieldSelection.options = self.allOptions;
    } else {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"self contains[cd] %@", searchText];
        self.formFieldSelection.options = [self.allOptions filteredArrayUsingPredicate:predicate];
    }
    [self.tableView reloadData];
}

@end
