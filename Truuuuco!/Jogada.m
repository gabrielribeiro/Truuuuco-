//
//  Jogada.m
//  Truuuuco!
//
//  Created by Gabriel Ribeiro on 09/10/13.
//  Copyright (c) 2013 Mobirama. All rights reserved.
//

#import "Jogada.h"
#import "Jogador.h"
#import "AppDelegate.h"
#import "Jogo.h"

@interface Jogada()

@property (nonatomic, strong) AppDelegate *app;
@property (nonatomic, weak) Jogo *jogo;

@end
@implementation Jogada

-(instancetype)initWithBaralho:(Baralho*)pBaralho;
{
    self = [super init];
    if (self) {
        self.vira = [pBaralho getCarta];
        self.trucante = -1;
        baralho = pBaralho;
        self.iValorJogada = 1;
        self.valorJogada = ValorJogadaHum;
        self.jogo.jogada = self;
    }
    return self;
}

-(int)jogarMao:(int)proximo andJogadores:(NSMutableArray*)jogadores{
    self.maoAtual = [[Mao alloc] initWithVira:self.vira];
    
    int cont = 0;
    
    do {
        Jogador *jogador = [jogadores objectAtIndex:proximo];
        
        NSLog(@"%@", jogador);
        
        AcaoJogador acao = [jogador getAcaoJogada:self];
        
        proximo = (proximo + 1) %4;
        
        if(acao == AcaoJogadorJogar){
            cont++;
        } else if(acao == AcaoJogadorAceitar){
            proximo -= 2;
            
            if(proximo < 0){
                proximo = 3;
            }
        } else if(acao == AcaoJogadorCorrer){
            break;
        }
    } while (cont < 4); //cond. truco
    
    //ver que equipe ganhou a mão
    NSLog(@"VENCEDOR: %u", self.maoAtual.vencedor);
    NSLog(@"VALOR DA JOGADA: %u", self.valorJogada);
    
    return self.maoAtual.vencedor;
}

@end
