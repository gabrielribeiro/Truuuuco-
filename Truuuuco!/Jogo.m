//
//  Jogo.m
//  Truuuuco!
//
//  Created by Gabriel Ribeiro on 09/10/13.
//  Copyright (c) 2013 Mobirama. All rights reserved.
//

#import "Jogo.h"
#import "Baralho.h"

@implementation Jogo

- (id)init
{
    self = [super init];
    if (self) {
        self.baralho = [[Baralho alloc] init];
    }
    return self;
}

-(bool)isFinalizado
{
    return self.pTimeA >= 12 || self.pTimeB >= 12;
}

/*-(void)placarGeral {
    NSLog(@"Placar Geral: \n Time A: %u \n Time B: %u \n", (self.pTimeA % 3), (self.pTimeB%3));
    if(self.pTimeA % 3 == 12)
    {
        NSLog(@"DA GAEM HAS ENDED");
    }
    if(self.pTimeB % 3 == 12)
    {
        NSLog(@"DA GAME HAS ENDED, MON");
    }
}*/

@end
