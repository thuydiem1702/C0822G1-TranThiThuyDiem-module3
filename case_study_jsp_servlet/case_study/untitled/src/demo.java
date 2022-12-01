import java.util.Arrays;
import java.util.Scanner;

public class demo {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Nhập độ dài của mảng: ");
        int size = Integer.parseInt(scanner.nextLine());
        int[] arr = new int[size];
        int[] arr1 = new int [10];

        for (int i = 0; i < size; i++) {
            System.out.print("Nhập phần tử thứ " + (i + 1) + ": ");
            arr[i] = Integer.parseInt(scanner.nextLine());
        }

        System.out.println("Mảng vừa nhập là: " + Arrays.toString(arr));
        System.out.println(Arrays.toString(countFreq(arr, size, arr1)));
    }

    public static int[] countFreq(int[] arr, int size, int[] arr1) {
        boolean[] array = new boolean[size];
        for (int i = 0; i < size; i++) {
            if (array[i]) {
                continue;
            }

            int count = 0;
            for (int j = i; j < size; j++) {
                if (arr[i] == arr[j]) {
                    array[j] = true;
                    count++;
                }
            }
            for (int j = 0; j < arr1.length; j++) {
                if (count > 1)
                    arr1[j] = arr[i];
            }

        }
        return arr1;
    }
}


