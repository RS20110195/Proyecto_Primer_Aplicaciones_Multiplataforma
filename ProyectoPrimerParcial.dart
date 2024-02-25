import 'dart:io';

main() {
  Menu();
}

//Variables
List<String> registro = []; //Tipo de Registro
List<double> monto = []; //Monto de Dinero sea positivo o negativo
List<String> descripcion = []; //Descripcion del registro
double SaldoActual = 0;

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
        Seguimiento_Estado_Financiero();
        break;
      case 3:
        print(Meta());
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
        double MoneyIngresado = double.parse('$auxMoney');
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
        double MoneyIngresado = double.parse('$aux');
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
      /*case 3:
        print("Impresion de Registros");
        for (var i = 0; i < registro.length; i++) {
          print("Tipo de Registro: " + registro[i]);
          print("Descripcion: " + descripcion[i]);
          print("Monto:  " + monto[i].toString());
        }
        break;*/
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

void Seguimiento_Estado_Financiero(){
  int optionSEF;
  do {
    print("----- Menu Seguimiento de saldo y Estado Financiero -----");
    print("1. Estado Financiero");
    print("2. Informes Financieros"); 
    print("0. Volver al Menu Principal");
    print("Ingresa una opción: ");
    String option = stdin.readLineSync().toString();
    optionSEF = int.parse('$option');

    switch (optionSEF) {
      case 1:
          double ingresosTotales = 0;
            for(double ingreso in monto){
              if(ingreso > 0){
                ingresosTotales += ingreso;
              }
           }
          double gastosTotales = 0;
          for(double gasto in monto){
          if(gasto < 0){
            gastosTotales += gasto.abs();
             }
          }
        print("----ESTADO FINANCIERO----");
        print("Ingresos Totales: $ingresosTotales");
        print("Gastos Totales: $gastosTotales");
        print("Saldo Actual: $SaldoActual");
        break;
      case 2:
        print("----- Informes Financieros -----");
        //Aqui se verifica si existen transacciones, en caso de que no se muestra el mensaje
        if (registro.isEmpty) {
          print("No hay transacciones para mostrar.");
        return;
        }
        //Recorremos las de registro para imprimir en cada iteracion
        for (int i = 0; i < registro.length; i++) {
          //Muestro 
          print("Fecha: ${DateTime.now()}");
          print("Tipo de Transacción: ${registro[i]}");
          print("Descripción: ${descripcion[i]}");
          print("Monto: \$${monto[i].abs().toStringAsFixed(2)}");
          print("");
        }
        break;
      case 0:
        print('Haz Regresado al Menu Principal');
        break;
      default:
        print("No es una Opcion del Sistema");
        break;
    }
  } while (optionSEF != 0);
}

//----------------------------------------------------------
String Meta() {
  print("Cuanto es tu meta financiera: ");
  String auxMeta = stdin.readLineSync().toString();
  double meta = double.parse('$auxMeta');
  if (meta <= SaldoActual) {
    return "Haz Alcanzado Tu Meta";
  } else {
    double Porcentaje = ((100 / meta) * SaldoActual);

    return "Vas por un Camino del $Porcentaje%";
  }
}