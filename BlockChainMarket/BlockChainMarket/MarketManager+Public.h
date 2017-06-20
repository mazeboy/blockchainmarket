//
//  MarketManager+Public.h
//  BlockChainMarket
//
//  Created by 张奎 on 2017/6/13.
//  Copyright © 2017年 张奎. All rights reserved.
//

#ifndef MarketManager_Public_h
#define MarketManager_Public_h

#import <Foundation/Foundation.h>

@protocol MarketManagerProtocol <NSObject>

@required
- (NSArray*) GetMarketList;
- (NSDictionary*) GetMarketDetails;

@end

#endif /* MarketManager_Public_h */
