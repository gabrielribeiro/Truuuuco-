//
//  Jogada.h
//  Truuuuco!
//
//  Created by Gabriel Ribeiro on 09/10/13.
//  Copyright (c) 2013 Mobirama. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mao.h"
#import "Baralho.h"

typedef enum ValorJogada{
    ValorJogadaHum = 1,
    ValorJogadaTres = 3,
    ValorJogadaSeis = 6,
    ValorJogadaNove = 9,
    ValorJogadaDoze = 12
}ValorJogada;

@interface Jogada : NSObject{
    Baralho *baralho;
}

@property (nonatomic,strong) Carta *vira;
@property (nonatomic,assign) ValorJogada valorJogada;
@property (nonatomic,assign) int trucante;
@property (nonatomic,assign) bool hasToAceitarRecusarTruco;
@property (nonatomic,strong) NSMutableArray *vencedores;
@property (nonatomic,strong) Mao *maoAtual;

-(instancetype)initWithBaralho:(Baralho*)pBaralho;
-(int)jogarMao:(int)proximo andJogadores:(NSMutableArray*)jogadores;
-(int)getPontuacao;

@end
