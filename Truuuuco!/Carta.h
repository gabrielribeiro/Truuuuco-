//
//  Carta.h
//  Truuuuco!
//
//  Created by Guilherme Titschkoski on 09/10/13.
//  Copyright (c) 2013 Mobirama. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum NaipeCarta
{
    NaipeCartaOuros = 11,
    NaipeCartaEspadas = 12,
    NaipeCartaCopas = 13,
    NaipeCartaPaus = 14
    
}NaipeCarta;

typedef enum ValorCarta
{
    ValorCartaQuatro = 1,
    ValorCartaCinco,
    ValorCartaSeis,
    ValorCartaSete,
    ValorCartaDamas,
    ValorCartaValete,
    ValorCartaReis,
    ValorCartaAs,
    ValorCartaDois,
    ValorCartaTres
}ValorCarta;

@interface Carta : NSObject

@property enum NaipeCarta naipe;
@property enum ValorCarta valor;

-(id)initWithValor:(ValorCarta)valor andNaipe:(NaipeCarta)naipe;
-(int)getPontuacao:(Carta *)vira;

@end
