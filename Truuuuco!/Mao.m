//
//  Mao.m
//  Truuuuco!
//
//  Created by Gabriel Ribeiro on 09/10/13.
//  Copyright (c) 2013 Mobirama. All rights reserved.
//

#import "Mao.h"

@implementation Mao

- (id)initWithVira:(Carta*)vira
{
    self = [super init];
    if (self) {
        self.trucoPedido = false;
        self.vira        = vira;
        
        self.acoesDosJogadores = [[NSMutableDictionary alloc] init];
        self.cartasJogadas     = [[NSMutableDictionary alloc] init];
    }
    return self;
}

-(bool)isTrucoPedido
{
    return self.trucoPedido;
}

-(void)addAcao:(AcaoTruco)acao forJogador:(int)jogador withCarta:(Carta*)carta
{
	[self.acoesDosJogadores setObject:[NSNumber numberWithInt:acao]
                               forKey:[NSNumber numberWithInt:jogador]];
    
	[self.cartasJogadas setObject:carta
                           forKey:[NSNumber numberWithInt:jogador]];
    
    if(acao == AcaoTrucoTrucar) {
        self.trucoPedido = YES;
    }
    
    if(acao == AcaoTrucoAceitar) {
        self.trucoPedido = NO;
    }
}

/*-(TimeEnum)timeVencedor
{
    int fujao = [self alguemCorreu];
    
    if(fujao > 0) {
        switch (fujao) {
            case JogadorA:
            case JogadorB:
                return TimeA;
                break;
            case JogadorC:
            case JogadorD:
                return TimeB;
                break;
        }
    }
    
    return TimeA;
}*/

-(JogadorEnum)alguemCorreu
{
    for (NSNumber *acaoNumber in self.acoesDosJogadores) {
        if(acaoNumber.intValue == AcaoTrucoFugir) {
            NSNumber *jogadorNumber = [self.acoesDosJogadores objectForKey:acaoNumber];
            return [jogadorNumber integerValue];
        }
    }
    
    return 0;
}

@end
