import java.util.Arrays;

public class RevisaoLogica {

    public static void main (String[] args) {

        //fazer um bublesort.
        //fazer o n-ésimo fibbonacci recursivo.
        //fazer um fibonacci ate um numero.
        //fazer um teste de primos.
        //fazer um primos até um numero.

        int[] inteiros = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};

        realocarArray(inteiros);

        for (int inteiro : inteiros) {
            System.out.println(inteiro);
            System.out.println(ehPrimo(inteiro));
        }
        System.out.println("n-ésimo Fibonnacci: " + nFibonnacciRecursivo(1));

        System.out.println("Fibonnacci até um número: " + Arrays.toString(fibonnacciAteUmNumero(10)));

        System.out.println("Primos: " + Arrays.toString(primoAteUmNumero(10)));
    }

    public static void realocarArray (int[] array) {
        for (int i = 0; i < array.length - 1; i++) {
            for (int j = 0; j < array.length - i - 1; j++) {
                if (array[j] > array[j + 1]) {
                    int temp = array[j];
                    array[j] = array[j + 1];
                    array[j + 1] = temp;
                }
            }
        }
    }

    public static int nFibonnacciRecursivo (int n) {
        if (n == 0) {
            return 0;
        } else if (n == 1) {
            return 1;
        } else {
            return nFibonnacciRecursivo(n - 1) + nFibonnacciRecursivo(n - 2);
        }
    }

    public static int[] fibonnacciAteUmNumero (int n) {
        int[] array = new int[n];
        array[0] = 0;
        array[1] = 1;
        for (int i = 2; i < n; i++) {
            array[i] = array[i - 1] + array[i - 2];
        }
        return array;
    }

    public static boolean ehPrimo(int n) {

        if (n == 2) {
            return true;
        }
        if (n == 1 || n <= 0) {
           return false;
        }
        if (n % 2 == 0) {
            return false;
        }

        for (int i = 3; i * i <= n; i += 2) {
            if (n % i == 0) {
                return false;
            }
        }
        return true;
    }

    public static int[] primoAteUmNumero(int n) {

        int[] primos = new int[n];

        for (int i = 0; i < n; i++) {
            if (ehPrimo(i)) {
                primos[i] = i;
            }
        }
        return primos;
    }
}