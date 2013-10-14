package truco;

public enum NaipeEnum {     
    PAUS(4),
    COPAS(3), 
    ESPADAS(2), 
    OUROS(1);
    
    private int valor;
    
    private NaipeEnum(int pvalor) {
          this.valor = pvalor;
    }

    public int getValor() { return valor; }
}  