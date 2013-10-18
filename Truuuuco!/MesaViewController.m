//
//  MesaViewController.m
//  Truuuuco!
//
//  Created by Gabriel Ribeiro on 14/10/13.
//  Copyright (c) 2013 Mobirama. All rights reserved.
//

#import "MesaViewController.h"
#import "jogo.h"
#import "Jogada.h"

static const int NUM_CARDS = 3;

@interface MesaViewController(){
    NSArray *cartasJogadorA, *cartasJogadorB, *cartasJogadorC, *cartasJogadorD;
}

@end

@implementation MesaViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)runGame
{
    Jogo *jogo = [[Jogo alloc] init];
    
    Jogador *jogadorA = [[Jogador alloc] init];
    Jogador *jogadorB = [[Jogador alloc] init];
    Jogador *jogadorC = [[Jogador alloc] init];
    Jogador *jogadorD = [[Jogador alloc] init];
    
    jogadorA.tipo = JogadorA;
    jogadorB.tipo = JogadorB;
    jogadorC.tipo = JogadorC;
    jogadorD.tipo = JogadorD;
    
    NSMutableArray *jogadores = [[NSMutableArray alloc] initWithObjects:jogadorA, jogadorB, jogadorC, jogadorD, nil];
    
    jogo.proximoJogador = arc4random() %4;
    
    do{
        Jogada *jogada = [[Jogada alloc] initWithBaralho:jogo.baralho];
        
        NSLog(@"VIRA: %@", jogada.vira);
        
        for (Jogador *temp in jogadores) {
            for (int i=0; i < NUM_CARDS; i++) {
                Carta *carta = [jogo.baralho getCarta];
                [temp receberCarta:carta];
            }
        }
        
        NSLog(@"===PRIMEIRA MÃO===");
        
        TimeEnum vencedorMao1 = [jogada jogarMao:jogo.proximoJogador andJogadores:jogadores];
        [jogada.vencedores addObject:[NSNumber numberWithInt:vencedorMao1]];
        
        NSLog(@"===SEGUNDA MÃO===");
        
        TimeEnum vencedorMao2 = [jogada jogarMao:jogo.proximoJogador andJogadores:jogadores];
        [jogada.vencedores addObject:[NSNumber numberWithInt:vencedorMao2]];
        
        if(![jogada prosseguirParaTerceiraMao])
        {
            [jogo atualizarPlacar:jogada];
            continue;
        }
        
        NSLog(@"===TERCEIRA MÃO===");
        TimeEnum vencedorMao3 = [jogada jogarMao:jogo.proximoJogador andJogadores:jogadores];
        [jogada.vencedores addObject:[NSNumber numberWithInt:vencedorMao3]];
        
        [jogo atualizarPlacar:jogada];
        
    }while (!jogo.isFinalizado);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    cartasJogadorA = @[self.jogadorACarta1, self.jogadorACarta2, self.jogadorACarta3];
    cartasJogadorB = @[self.jogadorBCarta1, self.jogadorBCarta2, self.jogadorBCarta3];
    cartasJogadorC = @[self.jogadorCCarta1, self.jogadorCCarta2, self.jogadorCCarta3];
    cartasJogadorD = @[self.jogadorDCarta1, self.jogadorDCarta2, self.jogadorDCarta3];
    
    
    UIImage *backImage = [UIImage imageNamed:@"back"];
    
    for (UIImageView *cartaImageView in cartasJogadorA) {
        cartaImageView.image = backImage;
    }
    
    for (UIImageView *cartaImageView in cartasJogadorB) {
        cartaImageView.image = backImage;
    }
    
    for (UIImageView *cartaImageView in cartasJogadorC) {
        cartaImageView.image = backImage;
    }
    
    for (UIImageView *cartaImageView in cartasJogadorD) {
        cartaImageView.image = backImage;
    }
    
    
    self.motionManager = [[CMMotionManager alloc] init];
    self.motionManager.accelerometerUpdateInterval = 0.2;
    self.motionManager.gyroUpdateInterval = 0.2;
    
    [self.motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue]
                                             withHandler:^(CMAccelerometerData  *accelerometerData, NSError *error) {
                                                 [self outputAccelertionData:accelerometerData.acceleration];
                                                 if(error){
                                                     
                                                     NSLog(@"%@", error);
                                                 }
                                             }];
    
    [self.motionManager startGyroUpdatesToQueue:[NSOperationQueue currentQueue]
                                    withHandler:^(CMGyroData *gyroData, NSError *error) {
                                        [self outputRotationData:gyroData.rotationRate];
                                    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)outputAccelertionData:(CMAcceleration)acceleration
{
    /*
    self.accX.text = [NSString stringWithFormat:@"Acceleration in X: %.2fg",acceleration.x];
    if(fabs(acceleration.x) > fabs(currentMaxAccelX))
    {
        currentMaxAccelX = acceleration.x;
    }
    self.accY.text = [NSString stringWithFormat:@"Acceleration in Y: %.2fg",acceleration.y];
    if(fabs(acceleration.y) > fabs(currentMaxAccelY))
    {
        currentMaxAccelY = acceleration.y;
    }
    self.accZ.text = [NSString stringWithFormat:@"Acceleration in Z: %.2fg",acceleration.z];
    if(fabs(acceleration.z) > fabs(currentMaxAccelZ))
    {
        currentMaxAccelZ = acceleration.z;
    }
    
    self.maxAccX.text = [NSString stringWithFormat:@"Max Acceleration in X: %.2f",currentMaxAccelX];
    self.maxAccY.text = [NSString stringWithFormat:@"Max Acceleration in Y: %.2f",currentMaxAccelY];
    self.maxAccZ.text = [NSString stringWithFormat:@"Max Acceleration in Z: %.2f",currentMaxAccelZ];
    */
}

-(void)outputRotationData:(CMRotationRate)rotation
{
    /*
    self.rotX.text = [NSString stringWithFormat:@"Rotation about X: %.2fr/s",rotation.x];
    if(fabs(rotation.x) > fabs(currentMaxRotX))
    {
        currentMaxRotX = rotation.x;
    }
    self.rotY.text = [NSString stringWithFormat:@"Rotation about Y: %.2fr/s",rotation.y];
    if(fabs(rotation.y) > fabs(currentMaxRotY))
    {
        currentMaxRotY = rotation.y;
    }
    self.rotZ.text = [NSString stringWithFormat:@"Rotation about Z: %.2fr/s",rotation.z];
    if(fabs(rotation.z) > fabs(currentMaxRotZ))
    {
        currentMaxRotZ = rotation.z;
    }
    
    self.maxRotX.text = [NSString stringWithFormat:@"Max Rotation about X: %.2f",currentMaxRotX];
    self.maxRotY.text = [NSString stringWithFormat:@"Max Rotation about Y: %.2f",currentMaxRotY];
    self.maxRotZ.text = [NSString stringWithFormat:@"Max Rotation about Z: %.2f",currentMaxRotZ];
    */
}

@end
