//
//  Carta.m
//  Truuuuco!
//
//  Created by Guilherme Titschkoski on 09/10/13.
//  Copyright (c) 2013 Mobirama. All rights reserved.
//

#import "Carta.h"

@implementation Carta

-(id)initWithValor:(enum ValorCarta)valor andNaipe:(enum NaipeCarta)naipe
{
    self = [super init];
    if(self) {
        self.valor = valor;
        self.naipe = naipe;
    }
    return self;
}

-(int)getPontuacao:(Carta *)vira
{
    if(vira.valor == self.valor -1)
    {
        return self.naipe;
    }
    else if(self.valor == 1 && vira.valor == 10)
    {
        return self.naipe;
    }
    
    return self.valor;
}

+(NSArray *)getNaipes
{
    NSMutableArray *naipes = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 4; i++) {
        NaipeCarta naipe = i+1;
        [naipes addObject:[NSNumber numberWithInt:naipe]];
    }
    
    return naipes;
}

+(NSArray *)getValores
{
    NSMutableArray *valores = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 10; i++) {
        NaipeCarta naipe = i+1;
        [valores addObject:[NSNumber numberWithInt:naipe]];
    }
    
    return valores;
}

@end
