//
//  TestAPI.h
//  DTTemplateListControllerExample
//
//  Created by renxun on 2018/8/9.
//  Copyright © 2018年 renxun. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^success)(NSArray *dataArr);

@interface TestAPI : NSObject

+ (void)getDataSuccess:(success)successBlock;

@end
