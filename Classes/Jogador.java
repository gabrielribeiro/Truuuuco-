package truco;

import java.io.IOException;

public class Jogador implements IJogador{
    
    private Carta cartas[] = new Carta[3];
    private int indexCarta;
    
    public void receberCartas(Carta cartasRecebidas[]){
        System.arraycopy(cartasRecebidas, 0, cartas, 0, 3);
    }
    
    public AcaoEnum jogar(Jogada jogada) throws IOException{
        Console.Write("Tecle:");
        
        if(jogada.MaoAtual == null || !jogada.MaoAtual.TrucoPedido){
            
            for(int i=0; i<3; i++){
                if(cartas[i] != null){
                    Console.Write(i+1 +") Jogar " + cartas[i]);
                }
            }
            
            Console.Write("4) Trucar");
            Console.Write("5) Correr");
            
            int acao = Console.Read();
            
            switch(acao){
                case 1:
                    indexCarta = acao -1;
                    
                    if(cartas[indexCarta] == null){
                        Console.Write("Jogou carta que não pode? Se fudeu. Perdeu a vez.");
                        return AcaoEnum.CORRER;
                    }
                    
                    return AcaoEnum.JOGAR;
                case 2:
                    indexCarta = acao -1;
                    
                    if(cartas[indexCarta] == null){
                        Console.Write("Jogou carta que não pode? Se fudeu. Perdeu a vez.");
                        return AcaoEnum.CORRER;
                    }
                    
                    return AcaoEnum.JOGAR;
                case 3:
                    indexCarta = acao -1;
                    
                    if(cartas[indexCarta] == null){
                        Console.Write("Jogou carta que não pode? Se fudeu. Perdeu a vez.");
                        return AcaoEnum.CORRER;
                    }
                    
                    return AcaoEnum.JOGAR;
                case 4:
                    indexCarta = -1;
                    return AcaoEnum.TRUCAR;
                case 5:
                    indexCarta = -1;
                    return AcaoEnum.CORRER;
            }
        }else {
            Console.Write("1) Aceitar");
            Console.Write("2) Correr");

            switch (jogada.ValorJogada) {
                case HUM:
                    Console.Write("3) Pedir Seis");
                    break;
                case TRES:
                    Console.Write("3) Pedir Nove");
                    break;
                case NOVE:
                    Console.Write("3) Pedir Doze");
                    break;
            }
            
            int acao = Console.Read();
            switch(acao){
                case 1:
                    switch (jogada.ValorJogada) {
                        case HUM:
                            jogada.ValorJogada = ValorJogadaEnum.TRES;
                            break;
                        case TRES:
                            jogada.ValorJogada = ValorJogadaEnum.SEIS;
                            break;
                        case SEIS:
                            jogada.ValorJogada = ValorJogadaEnum.NOVE;
                            break;
                        case NOVE:
                            jogada.ValorJogada = ValorJogadaEnum.DOZE;
                            break;
                    }
                    
                    return AcaoEnum.ACEITAR;
                case 2:
                    return AcaoEnum.CORRER;
                case 3:
                    switch (jogada.ValorJogada) {
                        case HUM:
                            jogada.ValorJogada = ValorJogadaEnum.TRES;
                            break;
                        case TRES:
                            jogada.ValorJogada = ValorJogadaEnum.SEIS;
                            break;
                        case SEIS:
                            jogada.ValorJogada = ValorJogadaEnum.NOVE;
                            break;
                        case NOVE:
                            jogada.ValorJogada = ValorJogadaEnum.DOZE;
                            break;
                    }
                    return AcaoEnum.AUMENTAR;
            }
        }
        
        return AcaoEnum.JOGAR;
    }
    
    public Carta getCarta(){
        if(indexCarta >= 0 && cartas[indexCarta] != null){
            Carta carta = cartas[indexCarta];
            cartas[indexCarta] = null;
            return carta;
        }
        else{
            return null;
        }
    }
}
