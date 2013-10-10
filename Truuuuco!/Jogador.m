//
//  Jogador.m
//  Truuuuco!
//
//  Created by Gabriel Ribeiro on 09/10/13.
//  Copyright (c) 2013 Mobirama. All rights reserved.
//

#import "Jogador.h"

@interface Jogador() {
    int indexCarta;
}

@end

@implementation Jogador

-(AcaoEnum)getAcaoJogada:(Jogada *)jogada {
    NSLog(@"Tecle:");
    
    if(jogada.maoAtual == nil || !jogada.maoAtual.trucoPedido){
        
        for(int i=0; i<3; i++){
            if(self.cartas[i] != nil){
                //NSLog(i+1 +") Jogar " + cartas[i]);
            }
        }
        
        NSLog(@"4) Trucar");
        NSLog(@"5) Correr");
        
        int acao;// = Console.Read();
        
        switch(acao){
            case 1:
                indexCarta = acao -1;
                
                if(self.cartas[indexCarta] == nil){
                    NSLog(@"Jogou carta que não pode? Se fudeu. Perdeu a vez.");
                    return Correr;
                }
                
                return Jogar;
            case 2:
                indexCarta = acao -1;
                
                if(self.cartas[indexCarta] == nil){
                    NSLog(@"Jogou carta que não pode? Se fudeu. Perdeu a vez.");
                    return Correr;
                }
                
                return Jogar;
            case 3:
                indexCarta = acao -1;
                
                if(self.cartas[indexCarta] == nil){
                    NSLog(@"Jogou carta que não pode? Se fudeu. Perdeu a vez.");
                    return Correr;
                }
                
                return Jogar;
            case 4:
                indexCarta = -1;
                return Trucar;
            case 5:
                indexCarta = -1;
                return Correr;
        }
    }else {
        NSLog(@"1) Aceitar");
        NSLog(@"2) Correr");
        
        switch (jogada.valorJogada) {
            case HUM:
                NSLog(@"3) Pedir Seis");
                break;
            case TRES:
                NSLog(@"3) Pedir Nove");
                break;
            case NOVE:
                NSLog(@"3) Pedir Doze");
                break;
        }
        
        int acao;// = Console.Read();
        switch(acao){
            case 1:
                switch (jogada.ValorJogada) {
                    case HUM:
                        jogada.ValorJogada = ValorJogadaEnum.TRES;
                        break;
                    case TRES:
                        jogada.ValorJogada = ValorJogadaEnum.SEIS;
                        break;
                    case SEIS:
                        jogada.ValorJogada = ValorJogadaEnum.NOVE;
                        break;
                    case NOVE:
                        jogada.ValorJogada = ValorJogadaEnum.DOZE;
                        break;
                }
                
                return Aceitar;
            case 2:
                return Correr;
            case 3:
                switch (jogada.ValorJogada) {
                    case HUM:
                        jogada.ValorJogada = ValorJogadaEnum.TRES;
                        break;
                    case TRES:
                        jogada.ValorJogada = ValorJogadaEnum.SEIS;
                        break;
                    case SEIS:
                        jogada.ValorJogada = ValorJogadaEnum.NOVE;
                        break;
                    case NOVE:
                        jogada.ValorJogada = ValorJogadaEnum.DOZE;
                        break;
                }
                return Aumentar;
        }
    }
    
    return Jogar;
}

-(void)receberCartas:(Carta*)carta {
    if([self.cartas count] >= 3) {
        return;
    }
    
    [self.cartas addObject:carta];
}

@end
