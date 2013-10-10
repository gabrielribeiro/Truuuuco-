//
//  Jogada.m
//  Truuuuco!
//
//  Created by Gabriel Ribeiro on 09/10/13.
//  Copyright (c) 2013 Mobirama. All rights reserved.
//

#import "Jogada.h"
#import "Jogador.h"

@implementation Jogada

-(instancetype)initWithBaralho:(Baralho*)pBaralho;
{
    self = [super init];
    if (self) {
        self.vira = [pBaralho getCarta];
        baralho = pBaralho;
    }
    return self;
}

-(int)jogarMao:(int)proximo andJogadores:(NSMutableArray*)jogadores{
    int cont = 0;
    
    do {
        Jogador *jogador = [jogadores objectAtIndex:proximo];
        
        NSLog(@"%@", jogador);
        
        AcaoJogador acao = [jogador getAcaoJogada:self];
        
        proximo = (proximo + 1) %4;
        
        if(acao == AcaoJogadorJogar){
            cont++;
        } else if(acao == AcaoJogadorAceitar){
            proximo -= 1;
            
            if(proximo < 0){
                proximo = 3;
            }
        }
    } while (cont < 4); //cond. truco
    
    //ver que equipe ganhou a mão
    NSLog(@"VENCEDOR: %u", self.maoAtual.vencedor);
    
    return self.maoAtual.vencedor;
}

@end
