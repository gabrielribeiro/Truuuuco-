package truco;

import java.io.IOException;

public class Truco {

    public static void main(String[] args) throws IOException {
        Jogo jogo = new Jogo();
        
        JogadoresEnum proximo = JogadoresEnum.JOGADOR;
        
        Jogador jogador = new Jogador();
        Oponente oponente = new Oponente();
        
        do{ 
            Console.Write("");
            Console.Write("Eu:   " + jogo.PontuacaoMinha);
            Console.Write("Dele: " + jogo.PontuacaoDele);
            
            Jogada jogada = jogo.NovaJogada();
            
            Console.Write("");
            Console.Write("Vira: " + jogada.Vira);
            Console.Write("");
            
            jogador.receberCartas(jogada.CartasMinhas);
            oponente.receberCartas(jogada.CartasOponente);
            
            //Primeira Mão                  
            jogada.MaoAtual = jogada.jogarMao(proximo, jogador, oponente);
            
            if(jogada.MaoAtual.vencedor != null)
                proximo = jogada.MaoAtual.vencedor;
            
            //Segunda Mão
            jogada.MaoAtual = jogada.jogarMao(proximo, jogador, oponente);
            
            if(jogada.VencedoresMaos[0] == jogada.VencedoresMaos[1]){
                jogo.AtualizaPlacar(jogada);
                continue;
            }
            
            if(!jogada.MaoAtual.Empachou)
                jogada.MaoAtual = jogada.jogarMao(proximo, jogador, oponente);
            
            jogo.AtualizaPlacar(jogada);
        }while (!jogo.Acabou());
    }
}