//
//  TestAPI.m
//  DTTemplateListControllerExample
//
//  Created by renxun on 2018/8/9.
//  Copyright © 2018年 renxun. All rights reserved.
//

#import "TestAPI.h"

@implementation TestAPI

+ (void)getDataSuccess:(success)successBlock {
    
    NSArray *dataArr = @[
                         @{
                             @"height": @"16",
                             @"width": @"9",
                             @"linkUrl": @"",
                             @"imageUrl":@"http://img-ws.qutui360.com/FkS8NgJbPtZZOqCITSpykii2Zey0",
                             @"type":@"gif",
                             },
                         @{
                             @"height": @"1",
                             @"width": @"1",
                             @"linkUrl": @"",
                             @"imageUrl":@"http://img-ws.qutui360.com/Ftm72zusJfDnQKq_2zEHTKmgK7Qy",
                             @"type":@"poster",

                             },
                         @{
                             @"height": @"16",
                             @"width": @"9",
                             @"linkUrl": @"",
                             @"imageUrl":@"http://img-ws.qutui360.com/Fl-obNtirzT1GRGA78OPBYZDAKTI",
                             @"type": @"voice",
                             },
                         @{
                             @"height": @"16",
                             @"width": @"9",
                             @"linkUrl": @"",
                             @"imageUrl":@"http://img-ws.qutui360.com/FkS8NgJbPtZZOqCITSpykii2Zey0",
                             @"type":@"gif",
                             },
                         @{
                             @"height": @"16",
                             @"width": @"9",
                             @"linkUrl": @"",
                             @"imageUrl":@"http://img-ws.qutui360.com/FkS8NgJbPtZZOqCITSpykii2Zey0",
                             @"type":@"gif",
                             },
                         @{
                             @"height": @"1",
                             @"width": @"1",
                             @"linkUrl": @"",
                             @"imageUrl":@"http://img-ws.qutui360.com/Ftm72zusJfDnQKq_2zEHTKmgK7Qy",
                             @"type":@"poster",
                             
                             },
                         @{
                             @"height": @"16",
                             @"width": @"9",
                             @"linkUrl": @"",
                             @"imageUrl":@"http://img-ws.qutui360.com/Fl-obNtirzT1GRGA78OPBYZDAKTI",
                             @"type": @"voice",
                             },
                         @{
                             @"height": @"1",
                             @"width": @"1",
                             @"linkUrl": @"",
                             @"imageUrl":@"http://img-ws.qutui360.com/Ftm72zusJfDnQKq_2zEHTKmgK7Qy",
                             @"type":@"poster",
                             
                             },
                         
                         @{
                             @"height": @"16",
                             @"width": @"9",
                             @"linkUrl": @"",
                             @"imageUrl":@"http://img-ws.qutui360.com/FkS8NgJbPtZZOqCITSpykii2Zey0",
                             @"type": @"voice",
                             },
                         @{
                             @"height": @"16",
                             @"width": @"9",
                             @"linkUrl": @"",
                             @"imageUrl":@"http://img-ws.qutui360.com/Fta-QsCh7DKkKnaQC6kREmUcBZ0A",
                             @"type":@"gif",
                             },
                         @{
                             @"height": @"1",
                             @"width": @"1",
                             @"linkUrl": @"",
                             @"imageUrl":@"http://img-ws.qutui360.com/FkS8NgJbPtZZOqCITSpykii2Zey0",
                             @"type":@"poster",
                             
                             },
                         @{
                             @"height": @"16",
                             @"width": @"9",
                             @"linkUrl": @"",
                             @"imageUrl":@"http://img-ws.qutui360.com/FkS8NgJbPtZZOqCITSpykii2Zey0",
                             @"type":@"gif",
                             },
                         @{
                             @"height": @"1",
                             @"width": @"1",
                             @"linkUrl": @"",
                             @"imageUrl":@"http://img-ws.qutui360.com/Ftm72zusJfDnQKq_2zEHTKmgK7Qy",
                             @"type":@"poster",
                             
                             },
                         @{
                             @"height": @"16",
                             @"width": @"9",
                             @"linkUrl": @"",
                             @"imageUrl":@"http://img-ws.qutui360.com/Fta-QsCh7DKkKnaQC6kREmUcBZ0A",
                             @"type": @"voice",
                             },
                         @{
                             @"height": @"16",
                             @"width": @"9",
                             @"linkUrl": @"",
                             @"imageUrl":@"http://img-ws.qutui360.com/Fta-QsCh7DKkKnaQC6kREmUcBZ0A",
                             @"type":@"gif",
                             },
                         ];
    successBlock(dataArr);
}
  
@end
