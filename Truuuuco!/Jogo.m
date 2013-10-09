//
//  Jogo.m
//  Truuuuco!
//
//  Created by Gabriel Ribeiro on 09/10/13.
//  Copyright (c) 2013 Mobirama. All rights reserved.
//

#import "Jogo.h"
#include "Baralho.h"

@implementation Jogo

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(bool)isFinalizado
{
    return self.pontuacaoTimeA >= 12 || self.pontuacaoTimeB >= 12;
}

-(void)atualizarPlacar:(Jogada*)jogada {
    
}

@end
