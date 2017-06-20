//
//  MarketManager+MarketManager.m
//  BlockChainMarket
//
//  Created by 张奎 on 2017/6/13.
//  Copyright © 2017年 张奎. All rights reserved.
//

#import "MarketManager.h"
#import "CoinItem.h"
#import "CoinInfo.h"

@implementation MarketManager
- (NSArray*) GetMarketList {

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
                MarketInfo* marketInfo = [[MarketInfo alloc] init];
            
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
                [marketList addObject:marketInfo];
            }
        }
    }

    return marketList;
}


- (NSDictionary*) GetMarketDetails {
    NSMutableDictionary *marketDetails = [[NSMutableDictionary alloc] init];
    
    NSURL *url = [NSURL URLWithString:@"https://yunbi.com//api/v2/tickers.json"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSHTTPURLResponse *response = nil; // 真实类型
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    NSString* marketInfosJson = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"marketinfo = %@", marketInfosJson);
    
    NSError * error = nil;
    id jsonObj = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    
    if ([jsonObj isKindOfClass:[NSDictionary class]]) {
        for (id infoKey in jsonObj) {
            id item = [jsonObj objectForKey:infoKey];
            
            if ([item isKindOfClass:[NSDictionary class]]) {
                CoinItem* coinItem = [CoinItem new];
                coinItem.timestamp = [item objectForKey:@"at"];
                coinItem.id = infoKey;
                id coinInfoDict = [item objectForKey:@"ticker"];
                
                if ([coinInfoDict isKindOfClass:[NSDictionary class]]) {
                    CoinInfo* coinInfo = [CoinInfo new];
                    coinInfo.buy = [coinInfoDict objectForKey:@"buy"];
                    coinInfo.sell = [coinInfoDict objectForKey:@"sell"];
                    coinInfo.low = [coinInfoDict objectForKey:@"low"];
                    coinInfo.high = [coinInfoDict objectForKey:@"high"];
                    coinInfo.last = [coinInfoDict objectForKey:@"last"];
                    coinInfo.vol = [coinInfoDict objectForKey:@"vol"];
                    coinItem.coinInfo = coinInfo;
                }
                
                [marketDetails setObject:coinItem forKey:coinItem.id];
            }
        }
        
    }
    
    return marketDetails;
}

@end
