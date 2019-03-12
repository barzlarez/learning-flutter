import 'dart:io';

main() {
    print("PENGULANGAN");

    print("Contoh FOR");
    int totalPengulangan = 10;
    for(int item in Iterable.generate(totalPengulangan, (cur) {
        var value = cur + 1;
        return value;
    })) {
        print("For item : $item");
    }
    print("--------------------");
    print("");

    print("Contoh WHILE");
    var tambah = 0;
    while(tambah < totalPengulangan) {
        print("While item : $tambah");
        tambah = tambah + 1;
    }
    print("--------------------");
    print("");

    print("Contoh DO WHILE");
    do {
        print("Do while item : $tambah");
        tambah = tambah - 1;
    } while (tambah > 0);
    print("--------------------");
}