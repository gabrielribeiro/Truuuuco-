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

- (id)init
{
    self = [super init];
    if (self) {
        self.cartas = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)jogarCartaParaJogada:(Jogada *)jogada {
    NSLog(@"%@ jogou %@", self, self.cartas[indexCarta]);
    
    [jogada.maoAtual.acoesDosJogadores setObject:[NSNumber numberWithInt:AcaoJogadorJogar]
                                          forKey:[NSNumber numberWithInt:self.tipo]];
    
    [jogada.maoAtual.cartasJogadas setObject:self.cartas[indexCarta]
                                      forKey:[NSNumber numberWithInt:self.tipo]];
    
    [self.cartas replaceObjectAtIndex:indexCarta withObject:nil];
}

-(AcaoJogador)getAcaoJogada:(Jogada *)jogada {
    NSLog(@"Tecle:");
    
    if(jogada.maoAtual == nil || !jogada.maoAtual.trucoPedido){
        
        for(int i=0; i<3; i++){
            if(self.cartas[i] != nil){
                NSLog(@"%u) Jogar %@", i+1, self.cartas[i]);
            }
        }
        
        NSLog(@"4) Trucar");
        NSLog(@"5) Correr");
        
        int acao = arc4random() % 5;// = Console.Read();
        
        acao = (acao == 0) ? 1 : acao;
        
        switch(acao){
            case 1:
                indexCarta = acao -1;
                
                if(self.cartas[indexCarta] == nil){
                    NSLog(@"Jogou carta que não pode? Se fudeu. Perdeu a vez.");
                    return AcaoJogadorCorrer;
                }
                
                [self jogarCartaParaJogada:jogada];
                
                return AcaoJogadorJogar;
            case 2:
                indexCarta = acao -1;
                
                if(self.cartas[indexCarta] == nil){
                    NSLog(@"Jogou carta que não pode? Se fudeu. Perdeu a vez.");
                    return AcaoJogadorCorrer;
                }
                
                [self jogarCartaParaJogada:jogada];
                
                return AcaoJogadorJogar;
            case 3:
                indexCarta = acao -1;
                
                if(self.cartas[indexCarta] == nil){
                    NSLog(@"Jogou carta que não pode? Se fudeu. Perdeu a vez.");
                    return AcaoJogadorCorrer;
                }
                
                [self jogarCartaParaJogada:jogada];
                
                return AcaoJogadorJogar;
            case 4:
                indexCarta = -1;
                
                jogada.maoAtual.trucoPedido = YES;
                
                NSLog(@"%@ TRUCOU!", self);
                
                return AcaoJogadorTrucar;
            case 5:
                indexCarta = -1;
                
                NSLog(@"%@ Fugiu!", self);
                
                return AcaoJogadorCorrer;
        }
    } else { //JÁ ESTÁ TRUCADO
        NSLog(@"1) Aceitar");
        NSLog(@"2) Correr");
        
        switch (jogada.valorJogada) {
            case ValorJogadaTres:
                NSLog(@"3) Pedir Seis");
                break;
            case ValorJogadaSeis:
                NSLog(@"3) Pedir Nove");
                break;
            case ValorJogadaNove:
                NSLog(@"3) Pedir Doze");
                break;
        }
        
        int acao = arc4random() % 3;// = Console.Read();
        
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
                NSLog(@"%@ Aceitou!", self);
                return AcaoJogadorAceitar;
            case 2:
                NSLog(@"%@ Correu!", self);
                return AcaoJogadorCorrer;
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
                NSLog(@"%@ Aumentou!", self);
                return AcaoJogadorAumentar;
        }
    }
    
    return AcaoJogadorJogar;
}

-(NSString *)description{
    switch (self.tipo) {
        case JogadorA:
            return @"JogadorA";
            break;
        case JogadorB:
            return @"JogadorB";
            break;
        case JogadorC:
            return @"JogadorC";
            break;
        case JogadorD:
            return @"JogadorD";
            break;
        default:
            return @"Zé ninguém";
            break;
    }
}

-(void)receberCarta:(Carta*)carta {
    if([self.cartas count] >= 3) {
        return;
    }
    
    [self.cartas addObject:carta];
}

@end
