//
//  ViewController.m
//  BlockChainMarket
//
//  Created by 张奎 on 2017/6/13.
//  Copyright © 2017年 张奎. All rights reserved.
//

#import "ViewController.h"
#import <Foundation/Foundation.h>

@implementation ViewController

static int cellHeight = 30;
static int cellInterval = 30;

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    id<MarketManagerProtocol> marketManager = [[MarketManager alloc] init];
    NSArray* marketList = [marketManager GetMaketList];
    
    NSLog(@"size:%d",marketList.count);
    
    int i = 0;
    for (NSValue* value in marketList) {
        MarketInfo marketInfo = [value marketInfoValue];
        
        NSTextField* textField = [[ NSTextField alloc] init];
        textField.placeholderString = marketInfo.name;
        textField.frame = CGRectMake(0,0+i*cellInterval,100,cellHeight) ;
        textField.accessibilityTitle = marketInfo.name;
        textField.editable = FALSE;
        textField.stringValue = marketInfo.name;
        [self.view addSubview:textField];
        ++i;
    }
    
    
    [self.view setFrameSize:NSMakeSize(500,i * (cellInterval + cellHeight))];    
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
