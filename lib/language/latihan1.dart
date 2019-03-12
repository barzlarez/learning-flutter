import 'dart:io';
/* APLIKASI ATM
Fitur
Login
Penarikan
Transfer
Cek Saldo
* */

main() {
    ATM();
}

class User extends Object {
    final String nama;
    final String pin;
    final String norek;
    double saldo;

    User(this.nama, this.pin, this.saldo, this.norek);
}

var users = [
    User("Ikhsan", "1234", 20000, "123-6"),
    User("Nana", "4367", 10000, "201-9"),
    User("Ramli", "2209", 30000, "222-5"),
    User("Diah", "3010", 50000, "333-5")
];


class ATM extends Object {

    User currentUser;

    ATM() {
        print("APLIKASI ATM");
        var running = true;
        while (running) {
            if (currentUser == null) {
                currentUser = login();
                if (currentUser == null) {
                    continue;
                }
                print("Halo, ${currentUser.nama}");
            }

            var selection = menu();
            print("====================================");
            switch (selection) {
                case 1:
                    withdraw();
                    break;
                case 2:
                    transfer();
                    break;
                case 3:
                    checkBalance();
                    break;
                case 4:
                    running = false;
                    break;
            }
        }
    }

    User login() {
        print("====================================");
        stdout.write("Silakan masukkan PIN : ");
        String pin = stdin.readLineSync();
        try {
            return users.firstWhere((user) {
                return user.pin == pin;
            });
        } catch (error) {
            print("PIN Anda salah");
            print("====================================");
            return null;
        }
    }

    int menu() {
        print("====================================");
        print("Selamat datang di ATM Eudeka");
        print("Silakan pilih menu");
        print("1. Penarikan");
        print("2. Transfer");
        print("3. Cek Saldo");
        print("4. Keluar");

        stdout.write("Pilihan Anda : ");
        return int.parse(stdin.readLineSync());
    }

    bool withdraw() {
        print("====================================");
        stdout.write("Silakan masukkan Jumlah Penarikan : ");
        double total = double.parse(stdin.readLineSync());
        if (currentUser.saldo > total) {
            currentUser.saldo = currentUser.saldo - total;
            print("Penarikan berhasil");
            print("====================================");
            return true;
        }

        print("Saldo Anda tidak mencukupi");
        print("====================================");
        return false;
    }

    bool transfer() {
        print("====================================");
        stdout.write("Silakan masukkan No Rek : ");
        String norek = stdin.readLineSync();
        User penerima;
        try {
            penerima = users.firstWhere((user) {
                return user.norek != currentUser.norek && user.norek == norek;
            });

            if (penerima != null) {
                stdout.write("Silakan masukkan Jumlah Transfer : ");
                double total = double.parse(stdin.readLineSync());
                if (total <= currentUser.saldo) {
                    penerima.saldo = penerima.saldo + total;
                    currentUser.saldo = currentUser.saldo - total;
                    print("Transfer berhasil dilakukan");
                    print("====================================");
                    return false;
                } else {
                    print("Saldo tidak mencukupi");
                    print("====================================");
                    return false;
                }
            }
        } catch (error) {
            print("No Rek penerima tidak ditemukan");
            print("====================================");
        }

        return false;
    }

    bool checkBalance() {
        print("====================================");
        stdout.write("Silakan masukkan PIN : ");
        String pin = stdin.readLineSync();
        if (currentUser.pin == pin) {
            print("Saldo Anda saat ini : ${currentUser.saldo}");
            print("====================================");
            return true;
        }

        print("PIN tidak sesuai");
        print("====================================");
        return false;
    }
}