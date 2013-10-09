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
        //acaoOponente = null
        //acaoJogador = acaoOponente;
        //cartaOponente = null;
        //cartaJogador = cartaOponente;
        self.trucoPedido = false;
        self.vira = vira;
    }
    return self;
}

-(bool)isTrucoPedido
{
    return self.trucoPedido;
}

-(void)addAcao:(AcaoTruco)acao forJogador:(NSObject*)jogador withCarta:(Carta*)carta
{
	//self.acaoJogador = acao;
	//self.cartaJogador = carta;
    
    if(acao == AcaoTrucoTrucar) {
        self.trucoPedido = YES;
    }
    
    if(acao == AcaoTrucoAceitar) {
        self.trucoPedido = NO;
    }
}

@end
