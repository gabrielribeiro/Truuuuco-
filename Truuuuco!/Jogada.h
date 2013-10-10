//
//  Jogada.h
//  Truuuuco!
//
//  Created by Gabriel Ribeiro on 09/10/13.
//  Copyright (c) 2013 Mobirama. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Baralho.h"
#import "Mao.h"

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

@property (nonatomic,assign) ValorJogada valorJogada;

-(instancetype)initWithBaralho:(Baralho*)pBaralho;

@end
