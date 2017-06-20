//
//  ViewController.m
//  BlockChainMarket
//
//  Created by 张奎 on 2017/6/13.
//  Copyright © 2017年 张奎. All rights reserved.
//

#import "ViewController.h"
#import <Foundation/Foundation.h>
#import "CoinItem.h"

@implementation ViewController

static int cellHeight = 30;
static int cellInterval = 30;

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    id<MarketManagerProtocol> marketManager = [[MarketManager alloc] init];
    NSArray* marketList = [marketManager GetMarketList];
    NSDictionary* marketDetails = [marketManager GetMarketDetails];
    
    NSLog(@"size:%d",marketList.count);
    
    int i = 0;
    for (MarketInfo* marketInfo in marketList) {
        CoinItem* coinItem = [marketDetails objectForKey:marketInfo.id];
            
        NSTextField* textField = [[ NSTextField alloc] init];
        textField.placeholderString = marketInfo.name;
        textField.frame = CGRectMake(0,0+i*cellInterval,1000,cellHeight) ;
        //textField.accessibilityTitle = [NSString stringWithFormat:@"%@ %@",
          //                              marketInfo.name, [coinItem ToString]];
        textField.editable = FALSE;
        textField.stringValue = [NSString stringWithFormat:@"%@ %@",
                                 marketInfo.name, [coinItem ToString]];
        [self.view addSubview:textField];
        ++i;
    }
    
    
    [self.view setFrameSize:NSMakeSize(500,i * (cellInterval + cellHeight))];
    //[self.view setFrameSize:NSMakeSize(100,100)];

}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
