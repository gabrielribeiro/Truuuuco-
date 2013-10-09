//
//  Carta.h
//  Truuuuco!
//
//  Created by Guilherme Titschkoski on 09/10/13.
//  Copyright (c) 2013 Mobirama. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Carta : NSObject

@property enum NaipeCarta naipe;

@property enum ValorCarta valor;

-(int)getPontuacao:(Carta *)vira;

-(id)init:(enum ValorCarta)valor eNaipe:(enum NaipeCarta)naipe;

enum NaipeCarta
{
    Ouros = 11,
    Espadas = 12,
    Copas = 13,
    Paus = 14
    
};

enum ValorCarta
{
    Quatro = 1,
    Cinco,
    Seis,
    Sete,
    Damas,
    Valete,
    Reis,
    As,
    Dois,
    Tres
};
@end
