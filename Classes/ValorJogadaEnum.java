package truco;

public enum ValorJogadaEnum {
    HUM(1),
    TRES(3), 
    SEIS(6), 
    NOVE(9),
    DOZE(12);
    
    private int valor;
    
    private ValorJogadaEnum(int pvalor) {
          this.valor = pvalor;
    }

    public int getValor() { return valor; }
}
