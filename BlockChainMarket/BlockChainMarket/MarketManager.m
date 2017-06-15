//
//  MarketManager+MarketManager.m
//  BlockChainMarket
//
//  Created by 张奎 on 2017/6/13.
//  Copyright © 2017年 张奎. All rights reserved.
//

#import "MarketManager.h"

@implementation MarketManager
- (NSArray*) GetMaketList {

    NSMutableArray *marketList = [[NSMutableArray alloc] init];
    
    NSURL *url = [NSURL URLWithString:@"https://yunbi.com//api/v2/markets.json"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSHTTPURLResponse *response = nil; // 真实类型
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    NSString* marketInfosJson = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"marketinfo = %@", marketInfosJson);
    
    NSError * error = nil;
    id arrayObj = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];

    if ([arrayObj isKindOfClass:[NSArray class]]) {
        for (id info in arrayObj) {
            if ([info isKindOfClass:[NSDictionary class]]) {
                MarketInfo marketInfo;
            
                for (NSString* key in info) {
                    NSString* value = [info objectForKey:key];
                    
                    
                    if ([key isEqualToString:@"id"]) {
                        marketInfo.id = value;
                    }
                    if ([key isEqualToString:@"name"]) {
                        marketInfo.name = value;
                    }
                }
                NSLog(@"add market:%@, name: %@", marketInfo.id, marketInfo.name);
                [marketList addObject:[NSValue valueWithMarketInfo:marketInfo]];
            }
        }
    }

    return marketList;
}

@end
