//
//  AppDelegate.m
//  Truuuuco!
//
//  Created by Gabriel Ribeiro on 09/10/13.
//  Copyright (c) 2013 Mobirama. All rights reserved.
//

#import "AppDelegate.h"
#import "Jogo.h"

@implementation AppDelegate

static const int NUM_CARDS = 3;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
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
        
        NSLog(@"VIRA: %@",jogada.vira);
        
        for (Jogador *temp in jogadores) {
            for (int i=0; i < NUM_CARDS; i++) {
                Carta *carta = [jogo.baralho getCarta];
                [temp receberCarta:carta];
            }
        }
        
        NSLog(@"===PRIMEIRA MÃO===");
        
        //Primeira Mão
        [jogada jogarMao:jogo.proximoJogador andJogadores:jogadores];
        
        //if(jogada.maoAtual.vencedor != nil)
            //proximo = jogada.maoAtual.vencedor;
        
        NSLog(@"===SEGUNDA MÃO===");
        
        //Segunda Mão
        [jogada jogarMao:jogo.proximoJogador andJogadores:jogadores];
        
        /*
        if(jogada.VencedoresMaos[0] == jogada.VencedoresMaos[1]){
            jogo.AtualizaPlacar(jogada);
            continue;
        }
        
        if(!jogada.MaoAtual.Empachou)
            [jogada jogarMao:jogo.proximoJogador andJogadores:jogadores];
        
         */
        
        [jogo atualizarPlacar:jogada];
        
    }while (!jogo.isFinalizado);
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
