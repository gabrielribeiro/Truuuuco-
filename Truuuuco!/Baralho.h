//
//  Baralho.h
//  Truuuuco!
//
//  Created by Guilherme Titschkoski on 09/10/13.
//  Copyright (c) 2013 Mobirama. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Carta.h"

@interface Baralho : NSObject{
    NSMutableArray *cartas;
    int cartaAtual;
}

-(void)embaralhar;
-(Carta *)getCarta;

@end
