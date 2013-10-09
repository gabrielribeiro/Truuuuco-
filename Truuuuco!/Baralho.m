//
//  Baralho.m
//  Truuuuco!
//
//  Created by Guilherme Titschkoski on 09/10/13.
//  Copyright (c) 2013 Mobirama. All rights reserved.
//

#import "Baralho.h"
#import "Carta.h"

@implementation Baralho

- (instancetype)init
{
    self = [super init];
    if (self) {
        cartas = [[NSMutableArray alloc]init];
        cartaAtual = 0;
        
        NSArray *naipes = [Carta getNaipes];
        NSArray *valores = [Carta getValores];
        
        for (NSNumber *naipe in naipes) {
            for(NSNumber *valor in valores) {
                Carta *carta = [[Carta alloc] initWithValor:valor.intValue andNaipe:naipe.intValue];
                [cartas addObject:carta];
            }
        }
        
        [self embaralhar];
    }
    return self;
}

-(void)embaralhar
{
    cartaAtual = 0;
    for (int i = 0; i< [cartas count]; i++) {
        int random = arc4random() % [cartas count];
        
        Carta *temp = cartas[i];
        Carta *novaCarta = cartas[random];
        
        [cartas replaceObjectAtIndex:i withObject:novaCarta];
        [cartas replaceObjectAtIndex:random withObject:temp];
    }
}

-(Carta*)getCarta
{
    if(cartaAtual < [cartas count]) {
        Carta * carta = cartas[cartaAtual];
        cartaAtual ++;
        return carta;
    }
    
    return nil;
}

@end
