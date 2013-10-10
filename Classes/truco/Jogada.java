package truco;

import java.io.IOException;

public class Jogada {
    public ValorJogadaEnum ValorJogada;
    
    public Mao MaoAtual;
    
    public Carta Vira;
    public Carta CartasMinhas[];
    public Carta CartasOponente[];
    
    public JogadoresEnum Pe;
    
    public JogadoresEnum Vencedor;
    public JogadoresEnum VencedoresMaos[];
    
    public Boolean TrucoPedido;
    
    public Jogada(Baralho baralho){
        baralho.embaralhar();
        
        this.CartasMinhas = new Carta[3];
        this.CartasOponente = new Carta[3];
               
        for(int i=0; i<3; i++){
            this.CartasMinhas[i] = baralho.sacarCarta();
        }
        
        for(int i=0; i<3; i++){
            this.CartasOponente[i] = baralho.sacarCarta();
        }
        
        this.Vira = baralho.sacarCarta();
        
        this.ValorJogada = ValorJogadaEnum.HUM;
        this.VencedoresMaos = new JogadoresEnum[3];
    }
    
    public Mao jogarMao(JogadoresEnum proximo, Jogador jogador, Oponente oponente) throws IOException{
        Mao mao = new Mao(this.Vira);
        Console.Write("");
        do{
            if(proximo == JogadoresEnum.JOGADOR){
                AcaoEnum acao = jogador.jogar(this);
                mao.addAcaoJogador(acao, jogador.getCarta());
                proximo = JogadoresEnum.OPONENTE;
            }else{
                AcaoEnum acao = oponente.jogar(this);
                mao.addAcaoOponente(acao, oponente.getCarta());
                proximo = JogadoresEnum.JOGADOR;
            }
        }while(mao.repetir());
        
        Console.Write("");
        Console.Write(mao.acaoJogador + " - " + mao.cartaJogador);
        Console.Write(mao.acaoOponente + " - " + mao.cartaOponente);
        Console.Write("");
        
        
        mao.verVencedor();
        
        for(int i=0; i<3; i++){
             if(VencedoresMaos[i] == null){
                 VencedoresMaos[i] = mao.vencedor;
                 break;
             }
        }
        
        Console.Write("Vencedor: " + mao.vencedor);
        Console.Write("");
        
        return mao;
    }
}
