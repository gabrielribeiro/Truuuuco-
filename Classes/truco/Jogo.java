package truco;

public class Jogo {
    
    public int PontuacaoMinha;
    public int PontuacaoDele;
    
    private Baralho baralho;
    
    public Jogo(){
        baralho = new Baralho();
        PontuacaoMinha=0;
        PontuacaoDele=0;
    }
    
    public Jogada NovaJogada(){
        return new Jogada(this.baralho);
    }
    
    public void AtualizaPlacar(Jogada jogada){
        int contJog = 0;
        int contOp = 0;
        
        if(jogada.VencedoresMaos[0] == null){
            switch (jogada.VencedoresMaos[1]) {
                case JOGADOR:
                    PontuacaoMinha += jogada.ValorJogada.getValor();
                    break;
                case OPONENTE:
                    PontuacaoDele += jogada.ValorJogada.getValor();
                    break;
            }
        }
        
        for(int i=0;i<3;i++){
            if(jogada.VencedoresMaos[i] == JogadoresEnum.JOGADOR){
                contJog += 1;
            }else if(jogada.VencedoresMaos[i] == JogadoresEnum.OPONENTE){
                contOp += 1;
            }
        }
        
        if(contJog > contOp){
            PontuacaoMinha += jogada.ValorJogada.getValor();
        }else{
            PontuacaoDele += jogada.ValorJogada.getValor();
        }
    }
    
    public boolean Acabou(){
        return PontuacaoMinha >= 12 || PontuacaoDele >= 12;
    }
}
