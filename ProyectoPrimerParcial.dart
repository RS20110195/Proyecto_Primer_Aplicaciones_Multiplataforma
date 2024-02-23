import 'dart:io';

main() {
  Menu();
}

//Variables
List<String> registro = [];
List<double> monto = [];
List<String> descripcion = [];
double SaldoActual = 0;
double MoneyIngresado = 0;

void Menu() {
  int option;
  do {
    print("----- Menu Sistema -----");
    print("1. Registro de Transacciones");
    print("2. Seguimiento de Saldo y Estado Financiero");
    print("3. Meta");
    print("0. Salir del Sistema");
    print("Ingresa una opción: ");
    String optio = stdin.readLineSync().toString();
    option = int.parse('$optio');

    switch (option) {
      case 1:
        Registro();
        break;
      case 2:
        print("Opcion 2");
        break;
      case 3:
        print("Opcion 3");
        break;
      case 0:
        print('Haz Salido del Sistema Vuelva Pronto *+*');
        break;

      default:
        print("No es una Opcion del Sistema");
        break;
    }
  } while (option != 0);
}

void Registro() {
  int optionR;
  do {
    print("----- Menu Registro -----");
    print("1. Ingresar");
    print("2. Retirar");
    print("0. Volver al Menu Principal");
    print("Ingresa una opción: ");
    String optio = stdin.readLineSync().toString();
    optionR = int.parse('$optio');

    switch (optionR) {
      case 1:
        print('Saldo Actual: $SaldoActual');
        print("Cuanto Dinero Quieres Ingresar: ");
        String auxMoney = stdin.readLineSync().toString();
        MoneyIngresado = double.parse('$auxMoney');
        if (MoneyIngresado < 0) {
        } else {
          SaldoActual += MoneyIngresado;
          monto.add(MoneyIngresado);
          print(
              "Ingresa La Categoria (alimentación, transporte, vivienda, entretenimiento): ");
          String auxCategoria = stdin.readLineSync().toString();
          descripcion.add(auxCategoria);
          registro.add("Ingreso");
        }

        break;
      case 2:
        print('Saldo Actual: $SaldoActual');
        print("Cuanto Dinero Quieres Retirar: ");
        String aux = stdin.readLineSync().toString();
        MoneyIngresado = double.parse('$aux');
        if (MoneyIngresado <= SaldoActual) {
          SaldoActual -= MoneyIngresado;
          monto.add(MoneyIngresado * (-1));
          print(
              "Ingresa La Categoria (alimentación, transporte, vivienda, entretenimiento): ");
          String auxCategoria = stdin.readLineSync().toString();
          descripcion.add(auxCategoria);
          registro.add("Retiro");
        } else {
          print('No puedes Retirar mas del Saldo Actual');
        }
      case 3:
        print("Impresion de Registros");
        for (var i = 0; i < registro.length; i++) {
          print("Tipo de Registro: " + registro[i]);
          print("Descripcion: " + descripcion[i]);
          print("Monto:  " + monto[i].toString());
        }
        break;
      case 0:
        print('Haz Regresado al Menu Principal');
        break;
      default:
        print("No es una Opcion del Sistema");
        break;
    }
  } while (optionR != 0);
}

double Saldo1() {
  return SaldoActual;
}
