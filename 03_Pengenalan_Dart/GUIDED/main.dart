import 'dart:io';

void main(){
  // variabel
  // var
  var name = "Praktikum PPB Maria";

  // Annotation
  String language = "Dart";
  print("Hello $name, welcome to $language");
  int umur = 20;
  print("Nama: $name, umur: $umur");

  // multiple
  int openHour, closedHour, now;
  openHour = 8;
  closedHour = 21;
  now = 22;

  // if-else
  String shopStatus = now >= openHour && now <= closedHour? "Hello, We're Open" : "Sorry, We're Closed";
  print(shopStatus);
  if (now >= openHour && now <= closedHour){
    print("Hello, We're Open");
  } else{
    print("Sorry, We're Closed");
  }

  // switch case
  var day = 3;
  switch(day){
    case 1:
      print("Senin");
      break;
    case 2:
      print("Selasa");
      break;
    case 3:
      print("Rabu");
      break;
    case 4:
      print("Kamis");
      break;
    case 5:
      print("Jumat");
      break;
    case 6:
      print("Sabtu");
      break;
    case 7:
      print("Minggu");
      break;
    default:
      print("Hari tidak valid");
  }

  // looping
  // fow loops
  for (int i = 0; i <= 5;  i++){
    print(i);
  }
  // while loops
  int i = 1;
  while (i <= 5){
    print(i);
    i++;
  }

  

  // fixed list
  List<int> fixedList = List.filled(3, 0);
  // Mengubah elemen dalam list
  fixedList[0] = 10;
  fixedList[1] = 20;
  fixedList[2] = 30;
  print("fixed list: $fixedList");

  // growable list
  List<int> growableList = [];
  growableList.add(10);
  growableList.add(20);
  growableList.add(30);
  growableList.add(140);
  growableList.add(40);
  growableList.remove(10);
  print("growable list: $growableList");
  
  // fungsi
  print(faktorial(5));
}

String faktorial(int nilai){
  if (nilai == 0){
    return "1";
  }
  return "$nilai x ${faktorial(nilai-1)}";
}