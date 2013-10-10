//
//  Mao.m
//  Truuuuco!
//
//  Created by Gabriel Ribeiro on 10/10/13.
//  Copyright (c) 2013 Mobirama. All rights reserved.
//

#import "Mao.h"
#import "Jogador.h"

@implementation Mao

- (id)initWithVira:(Carta*)vira
{
    self = [super init];
    if (self) {
        self.trucoPedido = NO;
        self.vira = vira;
        
        self.acoesDosJogadores = [[NSMutableDictionary alloc] init];
        self.cartasJogadas     = [[NSMutableDictionary alloc] init];
    }
    return self;
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

-(TimeEnum)definirVencedor{
    int fujao = [self alguemCorreu];
    
    if(fujao >= 0) {
        switch (fujao) {
            case JogadorA:
            case JogadorC:
                return TimeB;
                break;
            case JogadorB:
            case JogadorD:
                return TimeA;
                break;
        }
    }
    
    JogadorEnum jogadorComMaiorCarta;
    int maiorPontuacaoDeCartaJogada;
    
    for (NSNumber *jogadorNumber in self.cartasJogadas) {
        Carta *cartaJogada = [self.cartasJogadas objectForKey:jogadorNumber];
        
        if([cartaJogada getPontuacao:self.vira] > maiorPontuacaoDeCartaJogada){
            maiorPontuacaoDeCartaJogada = [cartaJogada getPontuacao:self.vira];
            jogadorComMaiorCarta = jogadorNumber.integerValue;
        }
    }
    
    switch (jogadorComMaiorCarta) {
        case JogadorA:
        case JogadorC:
            return TimeA;
            break;
        case JogadorB:
        case JogadorD:
            return TimeB;
            break;
    }
}

-(JogadorEnum)alguemCorreu
{
    for (NSNumber *jogadorNumber in self.acoesDosJogadores) {
        NSNumber *acaoNumber = [self.acoesDosJogadores objectForKey:jogadorNumber];
        
        if(acaoNumber.intValue == AcaoTrucoFugir) {

            return [jogadorNumber integerValue];
        }
    }
    
    return -1;
}


@end
