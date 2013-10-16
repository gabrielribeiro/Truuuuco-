//
//  Jogo.m
//  Truuuuco!
//
//  Created by Gabriel Ribeiro on 09/10/13.
//  Copyright (c) 2013 Mobirama. All rights reserved.
//

#import "Jogo.h"
#import "Baralho.h"

@interface Jogo()

@end

@implementation Jogo

- (id)init
{
    self = [super init];
    if (self) {
        self.baralho = [[Baralho alloc] init];
        self.continueJogo = NO;
    }
    return self;
}

-(void)placarGeral {
    [self FinishHim];
    if(self.app.vencedorMao1 == self.app.vencedorMao2){
        if(self.app.vencedorMao1 == 1)
        {
            self.pTimeB = self.pTimeB + self.jogada.valorJogada;
        }
        else if(self.app.vencedorMao1 == 0)
        {
            self.pTimeA += self.jogada.valorJogada;
        }
        self.continueJogo = YES;
    }
    if(!self.jogada.maoAtual.empatado)
    {
        [self FinishHim];
        if(self.app.vencedorMao3 == self.app.vencedorMao1)
        {
            if(self.app.vencedorMao1 == 1)
            {
                self.pTimeB = self.pTimeB + self.jogada.valorJogada;
            }
            else if(self.app.vencedorMao1 == 0)
            {
                self.pTimeA += self.jogada.valorJogada;
            }
        }
        [self FinishHim];
        if(self.app.vencedorMao3 == self.app.vencedorMao2)
        {
            if(self.app.vencedorMao3 == 1)
            {
                self.pTimeB = self.pTimeB + self.jogada.valorJogada;
            }
            else if(self.app.vencedorMao3 == 0)
            {
                self.pTimeA += self.jogada.valorJogada;
            }
        }
    }
    NSLog(@"Placar Parcial: \n Time A: %d \n Time B: %d", self.pTimeA, self.pTimeB);
    [self FinishHim];
    
}

-(void)FinishHim
{
    if (self.pTimeA >= 12 || self.pTimeB >= 12)
    {
        self.isFinalizado = YES;
    }
}

@end
