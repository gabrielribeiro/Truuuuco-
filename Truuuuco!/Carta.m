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
@end
