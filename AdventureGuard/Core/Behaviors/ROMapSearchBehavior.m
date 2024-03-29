//
//  ROMapSearchBehavior.m
//  AdventureGuard
//
//  This App has been generated using IBM Mobile UI Builder
//

#import "ROMapSearchBehavior.h"
#import "ROMapViewController.h"
#import "RONearFilter.h"
#import "ROOptionsFilter.h"
#import "ROAnnotation.h"
#import "ROUtils.h"
#import "RODataDelegate.h"

@interface ROMapSearchBehavior ()

@property (nonatomic, strong) ROMapViewController *mapViewController;

@property (nonatomic, strong) RONearFilter *nearFilter;

@property (nonatomic, assign) BOOL nearLocationWillLoad;

@end

@implementation ROMapSearchBehavior


- (RONearFilter *)nearFilterWithFieldName:(NSString *)fieldName {
    
    CLLocationCoordinate2D coord = self.mapViewController.mapView.centerCoordinate;
    return [RONearFilter filterWithFieldName:fieldName coord:coord];
}

- (void)onDataSuccess:(id)dataObject {
    
    if (self.nearLocationWillLoad) {
        
        self.nearLocationWillLoad = NO;
        if ([dataObject isKindOfClass:[NSArray class]]) {
            
            NSArray *items = (NSArray *)dataObject;
            if ([items count] != 0) {
                
                if (self.mapViewController.mapViewDelegate) {
                    
                    ROAnnotation *annotation = [self.mapViewController.mapViewDelegate annotationWithItem:[items objectAtIndex:0]];
                    [self.mapViewController showCoordinate:annotation.coordinate animated:YES];
                }
            }
        }
    }
}

- (ROMapViewController *)mapViewController {
    
    if (!_mapViewController && self.viewController) {
        _mapViewController = (ROMapViewController *)self.viewController;
    }
    return _mapViewController;
}

- (void)search:(NSString *)searchText {
    
    [self.mapViewController.view endEditing:YES];
    
    [self.mapViewController removeAnnotations];
    
    self.mapViewController.dataLoader.optionsFilter.searchText = searchText;
    
    if (self.nearFilter) {
        [self.mapViewController.dataLoader.optionsFilter.filters removeObject:self.nearFilter];
    }
    self.nearFilter = [self nearFilterWithFieldName:self.mapViewController.locationFieldName];
    
    [self.mapViewController.dataLoader.optionsFilter.filters addObject:self.nearFilter];
    
    if (searchText) {
        self.nearLocationWillLoad = YES;
        [self.mapViewController removeBoundingBoxFilter];
    } else {
        self.nearLocationWillLoad = NO;
        [self.mapViewController setBoundingBoxFilterWithFieldName:self.mapViewController.locationFieldName];
    }
    
    [self.viewController loadData];
    
    if (searchText) {
        
        NSString *datasourceName = NSStringFromClass([self.viewController.dataLoader.datasource class]);
        [[[ROUtils sharedInstance] analytics] logAction:@"search"
                                                 target:searchText
                                         datasourceName:datasourceName];
    }
}

@end
