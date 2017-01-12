//
//  MainMenuViewController.m
//  AdventureGuard
//
//  This App has been generated using IBM Mobile UI Builder
//

#import "LocalInfoViewController.h"
#import "MainMenuViewController.h"
#import "NavigateViewController.h"
#import "ReportViewController.h"
#import "ROLogoutBehavior.h"
#import "ROStyle.h"
#import "UIImage+RO.h"

@interface MainMenuViewController ()

@end

@implementation MainMenuViewController

- (instancetype)init {

    self = [super init];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad {

    [super viewDidLoad];

	LocalInfoViewController *tab1 = [LocalInfoViewController new];
	tab1.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Local Info" image:[UIImage imageNamed:@"LocalInfoIcon573.png"] tag:0];
 
	ReportViewController *tab2 = [ReportViewController new];
	tab2.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Report" image:[UIImage imageNamed:@"ReportIcon649.png"] tag:1];
 
	NavigateViewController *tab3 = [NavigateViewController new];
	tab3.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Navigate" image:[UIImage imageNamed:@"Navigate43.png"] tag:2];
 
	[tab1.behaviors addObject:[ROLogoutBehavior behaviorViewController:tab1]];
	[tab2.behaviors addObject:[ROLogoutBehavior behaviorViewController:tab2]];
	[tab3.behaviors addObject:[ROLogoutBehavior behaviorViewController:tab3]];

	self.viewControllers = @[
		[[UINavigationController alloc] initWithRootViewController:tab1],
		[[UINavigationController alloc] initWithRootViewController:tab2],
		[[UINavigationController alloc] initWithRootViewController:tab3],
        
	];

	if (![UITabBar instancesRespondToSelector:@selector(unselectedItemTintColor)]) {
    
    	// Tint unselected item for iOS minor than 10
		for(UITabBarItem *item in self.tabBar.items) {
            
			item.image = [[item.selectedImage ro_tintColor:[[ROStyle sharedInstance] notSelectedColor]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
		}
	}
		
     
}
@end

