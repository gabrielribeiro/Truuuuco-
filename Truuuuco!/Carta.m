//
//  Carta.m
//  Truuuuco!
//
//  Created by Guilherme Titschkoski on 09/10/13.
//  Copyright (c) 2013 Mobirama. All rights reserved.
//

#import "Carta.h"

@implementation Carta

-(id)initWithValor:(ValorCarta)valor andNaipe:(NaipeCarta)naipe
{
    self = [super init];
    if(self) {
        self.valor = valor;
        self.naipe = naipe;
    }
    return self;
}

-(NSString *)description{
    NSString *valor, *naipe;
    
    switch (self.valor) {
        case ValorCartaQuatro:
            valor = @"4";
            break;
        case ValorCartaCinco:
            valor = @"5";
            break;
        case ValorCartaSeis:
            valor = @"6";
            break;
        case ValorCartaSete:
            valor = @"7";
            break;
        case ValorCartaDamas:
            valor = @"Q";
            break;
        case ValorCartaValete:
            valor = @"J";
            break;
        case ValorCartaReis:
            valor = @"K";
            break;
        case ValorCartaAs:
            valor = @"A";
            break;
        case ValorCartaDois:
            valor = @"2";
            break;
        case ValorCartaTres:
            valor = @"3";
            break;
    }
    
    switch (self.naipe) {
        case NaipeCartaPaus:
            naipe = @"Paus";
            break;
        case NaipeCartaCopas:
            naipe = @"Copas";
            break;
        case NaipeCartaEspadas:
            naipe = @"Espadas";
            break;
        case NaipeCartaOuros:
            naipe = @"Ouros";
            break;
    }
    
    return [NSString stringWithFormat:@"%@ de %@", valor, naipe];
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
    
    for (int i = 1; i < 5; i++) {
        NaipeCarta naipe = i+10;
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
