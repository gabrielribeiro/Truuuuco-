/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package truco;

import java.io.*;
import java.io.InputStreamReader;
import java.io.LineNumberReader;
import java.util.Scanner;

/**
 *
 * @author Gabriel Ribeiro
 */
class Console {
    static void Write(String s){
        System.out.println(s);
    }
    
    static int Read() throws IOException{
        String strValor;
        int valor = 0;
        
        BufferedReader teclado = new BufferedReader(new InputStreamReader(System.in));
        
        strValor = teclado.readLine();
        
        valor = Integer.parseInt(strValor);
        
        return valor;
    }
}
