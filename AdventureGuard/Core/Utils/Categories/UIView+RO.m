//
//  UIView+RO.m
//  AdventureGuard
//
//  This App has been generated using IBM Mobile UI Builder
//

#import "UIView+RO.h"
#import "ROChartView.h"

@implementation UIView (RO)

- (void)ro_setBackgroundView:(UIView *)backgroundView {

    dispatch_async(dispatch_get_main_queue(), ^{
        
        [self insertSubview:backgroundView atIndex:0];
        
        backgroundView.translatesAutoresizingMaskIntoConstraints = NO;
        
        NSDictionary *views = NSDictionaryOfVariableBindings(backgroundView);
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[backgroundView]|"
                                                                     options:NSLayoutFormatAlignAllTrailing
                                                                     metrics:nil
                                                                       views:views]];
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[backgroundView]|"
                                                                     options:NSLayoutFormatAlignAllTrailing
                                                                     metrics:nil
                                                                       views:views]];
        
    });
}

- (void)ro_setBackgroundImage:(UIImage *)image {
    
    UIImageView *backgroundView = [[UIImageView alloc] initWithImage:image];
    backgroundView.opaque = NO;
    backgroundView.clipsToBounds = YES;
    backgroundView.contentMode = UIViewContentModeScaleAspectFill;
    
    [self ro_setBackgroundView:backgroundView];
}

- (void)ro_setBackgroundPattern:(UIImage *)image {
    
    [self setBackgroundColor:[UIColor colorWithPatternImage:image]];
}

- (void)ro_setBackgroundColor:(UIColor *)color {
    
    if ([self isKindOfClass:[UITableView class]]) {
        UITableView *tableView = (UITableView *)self;
        tableView.backgroundColor = color;
        tableView.backgroundView = nil;
    } else if ([self isKindOfClass:[UICollectionView class]]) {
        UICollectionView *collectionView = (UICollectionView *)self;
        collectionView.backgroundColor = color;
        collectionView.backgroundView = nil;
    } else {
        self.backgroundColor = color;
    }
}

- (UIToolbar *)ro_toolbarBottom {
    
    UIToolbar *toolbar;
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:[UIToolbar class]] && view.tag == 999) {
            toolbar = (UIToolbar *)view;
            break;
        }
    }
    return toolbar;
}

- (UIToolbar *)ro_addToolbarBottom {
    
    UIToolbar *toolbar;
    
    UITableView *tableView;
    UICollectionView *collectionView;
    
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:[UITableView class]]) {
            tableView = (UITableView *)view;
        } else if ([view isKindOfClass:[UICollectionView class]]) {
            collectionView = (UICollectionView *)view;
        }
    }
    
    UIScrollView *dataView;
    if (tableView) {
        dataView = tableView;
    } else if (collectionView) {
        dataView = collectionView;
    }
    
    if (dataView) {
        toolbar = [self ro_toolbarBottom];
        if (toolbar == nil) {
            toolbar = [UIToolbar new];
            toolbar.translatesAutoresizingMaskIntoConstraints = NO;
            toolbar.tag = 999;
            
            [self addSubview:toolbar];
            
            NSDictionary *viewsBindings = @{
                                            @"toolbar" : toolbar,
                                            };
            
            // align tableView from the left and right
            [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[toolbar]-0-|"
                                                                             options:NSLayoutFormatDirectionLeadingToTrailing
                                                                             metrics:nil
                                                                               views:viewsBindings]];
            
            // align tableView from the top
            [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[toolbar(==44)]-0-|"
                                                                             options:NSLayoutFormatDirectionLeadingToTrailing
                                                                             metrics:nil
                                                                               views:viewsBindings]];
            
            UIEdgeInsets dataViewInsets = dataView.contentInset;
            dataViewInsets.bottom += 44.0f;
            [dataView setContentInset:dataViewInsets];
        }
    }

    return toolbar;
}

@end
