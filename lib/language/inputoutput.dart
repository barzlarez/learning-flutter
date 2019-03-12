import 'dart:io';

main() {
    stdout.write("Nama saya: ");
    var nama = stdin.readLineSync();
    print("Halo $nama!");
}