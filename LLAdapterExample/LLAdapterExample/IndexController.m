//
//  IndexController.m
//  LLAdapterExample
//
//  Created by renxun on 2019/11/1.
//  Copyright © 2019 ylin.yang. All rights reserved.
//

#import "IndexController.h"
#import "CollectViewControllerForIndex.h"


@interface IndexController ()

@end

@implementation IndexController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)collectionAction:(id)sender {
    CollectViewControllerForIndex *index = [CollectViewControllerForIndex new];
    [self.navigationController pushViewController:index animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
