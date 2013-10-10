//
//  Jogador.m
//  Truuuuco!
//
//  Created by Gabriel Ribeiro on 09/10/13.
//  Copyright (c) 2013 Mobirama. All rights reserved.
//

#import "Jogador.h"
#import "Jogada.h"

@interface Jogador() {
    int indexCarta;
}

@end

@implementation Jogador

/*
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
        
        int acao = 0;// = Console.Read();
        
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
            case ValorJogadaHum:
                NSLog(@"3) Pedir Seis");
                break;
            case ValorJogadaTres:
                NSLog(@"3) Pedir Nove");
                break;
            case ValorJogadaSeis:
                NSLog(@"3) Pedir Doze");
                break;
        }
        
        int acao;// = Console.Read();
        switch(acao){
            case 1:
                switch (jogada.valorJogada) {
                    case ValorJogadaHum:
                        jogada.ValorJogada = ValorJogadaTres;
                        break;
                    case ValorJogadaTres:
                        jogada.ValorJogada = ValorJogadaSeis;
                        break;
                    case ValorJogadaSeis:
                        jogada.ValorJogada = ValorJogadaNove;
                        break;
                    case ValorJogadaNove:
                        jogada.ValorJogada = ValorJogadaDoze;
                        break;
                }
                
                return Aceitar;
            case 2:
                return Correr;
            case 3:
                switch (jogada.valorJogada) {
                    case ValorJogadaHum:
                        jogada.ValorJogada = ValorJogadaTres;
                        break;
                    case ValorJogadaTres:
                        jogada.ValorJogada = ValorJogadaSeis;
                        break;
                    case ValorJogadaSeis:
                        jogada.ValorJogada = ValorJogadaNove;
                        break;
                    case ValorJogadaNove:
                        jogada.ValorJogada = ValorJogadaDoze;
                        break;
                }
                return Aumentar;
        }
    }
    
    return Jogar;
}
*/

-(void)receberCartas:(Carta*)carta {
    if([self.cartas count] >= 3) {
        return;
    }
    
    [self.cartas addObject:carta];
}

@end
