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
    }
    return self;
}

-(void)placarGeral {
    if(self.app.vencedorMao1 == self.app.vencedorMao2){
        if(self.app.vencedorMao1 == 1)
        {
            NSLog(@"%u", self.jogada.valorJogada);
            self.pTimeB = self.pTimeB + self.jogada.valorJogada;
        }
        else
        {
            NSLog(@"%u", self.jogada.valorJogada);
            self.pTimeA += self.jogada.valorJogada;
        }
        NSLog(@"Placar Parcial: \n Time A: %d \n Time B: %d", self.pTimeA, self.pTimeB);
    }
    if(!self.jogada.maoAtual.empatado)
    {
        if(self.app.vencedorMao3 == self.app.vencedorMao1)
        {
            if(self.app.vencedorMao1 == 1)
            {
                NSLog(@"%u", self.jogada.valorJogada);
                self.pTimeB = self.pTimeB + self.jogada.iValorJogada;
            }
            else
            {
                NSLog(@"%u", self.jogada.valorJogada);
                self.pTimeA += self.jogada.iValorJogada;
            }
        }
        if(self.app.vencedorMao3 == self.app.vencedorMao2)
        {
            if(self.app.vencedorMao3 == 1)
            {
                NSLog(@"%u", self.jogada.valorJogada);
                self.pTimeB = self.pTimeB + self.jogada.iValorJogada;
            }
            else
            {
                NSLog(@"%u", self.jogada.valorJogada);
                self.pTimeA += self.jogada.iValorJogada;
            }
        }
        NSLog(@"Placar Parcial: \n Time A: %d \n Time B: %d", self.pTimeA, self.pTimeB);
    }
    
    if (self.pTimeA >= 12 || self.pTimeB >= 12)
    {
        self.isFinalizado = YES;
    }
    
}

@end
