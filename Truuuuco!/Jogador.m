 //
//  Jogador.m
//  Truuuuco!
//
//  Created by Gabriel Ribeiro on 09/10/13.
//  Copyright (c) 2013 Mobirama. All rights reserved.
//

#import "Jogador.h"
#import "Jogada.h"
#import "Jogo.h"

@interface Jogador() {
    int indexCarta;
}
@property (nonatomic, weak) Jogada *jogada;
@property (nonatomic, weak) Jogo *jogo;

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
    
    [self.cartas replaceObjectAtIndex:indexCarta withObject:[NSNull null]];
}

-(AcaoJogador)getAcaoJogada:(Jogada *)jogada {
    NSLog(@"Tecle:");
    
    if(!jogada.hasToAceitarRecusarTruco){
        
        for(int i=0; i<3; i++){
            if(self.cartas[i] != nil && self.cartas[i] != [NSNull null]){
                NSLog(@"%u) Jogar %@", i+1, self.cartas[i]);
            }
        }
        
        int acao;
        
        if(jogada.trucante != self.tipo) {
            NSLog(@"4) Trucar");
        } else {
            NSLog(@"4) Aumentar");
        }
        
        NSLog(@"5) Correr");
        
        acao = arc4random() % 6;
        
        acao = (acao == 0) ? 1 : acao;
        
        switch(acao){
            case 1:
                indexCarta = acao -1;
                
                if(self.cartas[indexCarta] == [NSNull null]){
                    NSLog(@"Jogou carta que não pode? Se fudeu. Perdeu a vez.");
                    [jogada.maoAtual.acoesDosJogadores setObject:[NSNumber numberWithInt:AcaoJogadorCorrer]
                                                          forKey:[NSNumber numberWithInt:self.tipo]];
                    return AcaoJogadorCorrer;
                }
                
                [self jogarCartaParaJogada:jogada];
                
                return AcaoJogadorJogar;
            case 2:
                indexCarta = acao -1;
                
                if(self.cartas[indexCarta] == [NSNull null]){
                    NSLog(@"Jogou carta que não pode? Se fudeu. Perdeu a vez.");
                    [jogada.maoAtual.acoesDosJogadores setObject:[NSNumber numberWithInt:AcaoJogadorCorrer]
                                                          forKey:[NSNumber numberWithInt:self.tipo]];
                    return AcaoJogadorCorrer;
                }
                
                [self jogarCartaParaJogada:jogada];
                
                return AcaoJogadorJogar;
            case 3:
                indexCarta = acao -1;
                
                if(self.cartas[indexCarta] == [NSNull null]){
                    NSLog(@"Jogou carta que não pode? Se fudeu. Perdeu a vez.");
                    [jogada.maoAtual.acoesDosJogadores setObject:[NSNumber numberWithInt:AcaoJogadorCorrer]
                                                          forKey:[NSNumber numberWithInt:self.tipo]];
                    return AcaoJogadorCorrer;
                }
                
                [self jogarCartaParaJogada:jogada];
                
                return AcaoJogadorJogar;
            case 4:
                indexCarta = -1;
                
                jogada.trucante = self.tipo;
                jogada.hasToAceitarRecusarTruco = YES;
                
                [jogada.maoAtual.acoesDosJogadores setObject:[NSNumber numberWithInt:AcaoJogadorJogar]
                                                      forKey:[NSNumber numberWithInt:self.tipo]];
                
                if(jogada.trucante >= 0 && jogada.trucante != self.tipo)
                {
                    switch (jogada.valorJogada) {
                        case ValorJogadaHum:
                            jogada.ValorJogada = ValorJogadaSeis;
                            break;
                        case ValorJogadaTres:
                            jogada.ValorJogada = ValorJogadaNove;
                            break;
                        case ValorJogadaSeis:
                            jogada.ValorJogada = ValorJogadaDoze;
                            break;
                        default:
                            jogada.valorJogada = ValorJogadaTres;
                            break;
                    }
                    
                    NSLog(@"%@ Aumentou!", self);
                    return AcaoJogadorAumentar;
                }
                else
                {
                    NSLog(@"%@ TRUCOU!", self);
                    
                    return AcaoJogadorTrucar;
                }
            case 5:
                indexCarta = -1;
                
                [jogada.maoAtual.acoesDosJogadores setObject:[NSNumber numberWithInt:AcaoJogadorCorrer]
                                                      forKey:[NSNumber numberWithInt:self.tipo]];
                
                NSLog(@"%@ Fugiu!", self);
                
                return AcaoJogadorCorrer;
        }
    } else { //DEVE ACEITAR TRUCO
        
        NSLog(@"1) Aceitar");
        NSLog(@"2) Correr");
        
        if(jogada.valorJogada < ValorJogadaDoze){
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
                default:
                    break;
            }
        }
        
        int acao;
        
        if([self getTimeDoJogador:self.tipo] == [self getTimeDoJogador:jogada.trucante]){
            acao = arc4random() % 3;// = Console.Read();
        } else {
            acao = arc4random() % 4;// = Console.Read();
        }
        
        acao = acao == 0 ? 1 : acao;
        
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
                    case ValorJogadaDoze:
                        NSLog(@"Nao é possivel aumentar");
                }
                jogada.hasToAceitarRecusarTruco = NO;
                NSLog(@"%@ Aceitou!", self);
                return AcaoJogadorAceitar;
            case 2:
                jogada.hasToAceitarRecusarTruco = NO;
                
                [jogada.maoAtual.acoesDosJogadores setObject:[NSNumber numberWithInt:AcaoJogadorCorrer]
                                                      forKey:[NSNumber numberWithInt:self.tipo]];
                
                NSLog(@"%@ Correu!", self);
                return AcaoJogadorCorrer;
            case 3:
                switch (jogada.valorJogada) {
                    case ValorJogadaHum:
                        jogada.ValorJogada = ValorJogadaSeis;
                        break;
                    case ValorJogadaTres:
                        jogada.ValorJogada = ValorJogadaNove;
                        break;
                    case ValorJogadaSeis:
                        jogada.ValorJogada = ValorJogadaDoze;
                        break;
                    default:
                        jogada.valorJogada = ValorJogadaDoze;
                        break;
                }
                
                jogada.trucante = self.tipo;
                jogada.hasToAceitarRecusarTruco = YES;
                
                NSLog(@"%@ Aumentou!", self);
                return AcaoJogadorAumentar;
        }
    }

    
    return AcaoJogadorJogar;
}

-(int)getTimeDoJogador:(int)jogador{
    switch (jogador) {
        case JogadorA:
        case JogadorC:
            return TimeA;
            break;
        case JogadorB:
        case JogadorD:
            return TimeA;
            break;
    }
    
    return -1;
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
