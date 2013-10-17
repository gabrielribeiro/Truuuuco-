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
        self.pontuacaoTimeA = 0;
        self.pontuacaoTimeB = 0;
    }
    return self;
}

-(BOOL)isFinalizado
{
    return (self.pontuacaoTimeA >= 12 || self.pontuacaoTimeB >= 12);
}

-(void)atualizarPlacar:(Jogada*)jogada
{
    TimeEnum vencedorPrimeira = ((NSNumber*)jogada.vencedores[0]).intValue;
    TimeEnum vencedorSegunda = ((NSNumber*)jogada.vencedores[1]).intValue;
    
    if(vencedorPrimeira == vencedorSegunda){
        
        switch (vencedorPrimeira) {
            case TimeA:
                self.pontuacaoTimeA += jogada.valorJogada;
                break;
            case TimeB:
                self.pontuacaoTimeB += jogada.valorJogada;
                break;
        }
    }
    
    NSLog(@"Placar Parcial: \n Time A: %d \n Time B: %d", self.pontuacaoTimeA, self.pontuacaoTimeB);
    return;
    
    TimeEnum vencedorTerceira = ((NSNumber*)jogada.vencedores[2]).intValue;
    
    if(!jogada.maoAtual.empatado)
    {
        switch (vencedorTerceira) {
            case TimeA:
                self.pontuacaoTimeA += jogada.valorJogada;
                break;
            case TimeB:
                self.pontuacaoTimeB += jogada.valorJogada;
                break;
        }
    }
    
    NSLog(@"Placar Parcial: \n Time A: %d \n Time B: %d", self.pontuacaoTimeA, self.pontuacaoTimeB);
}

@end
