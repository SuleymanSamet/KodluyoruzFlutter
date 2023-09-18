void main() {
  // Exercise 1
  print("Hello, World!"); //hello world olarak çıktı verir
  print("Hi Kod"); //hi kod olarak çıktı verdirdik

  // Exercise 2
  String name = "Süleyman ";
  int age = 22;
  double height = 184;
  bool isStudent = true;

  print("Name: $name");
  print("Age: $age");
  print("Height: $height cm");
  print("I am not a student: $isStudent");

  // Exercise 3
  double a = 10;
  double b = 5;
  double c = 20;

  double sonuc = ((a - b) * c) / (a + b) * (a * b * c);

  print("Sonuç: $sonuc");

  // Exercise 4
  int charge = 101;

  if (charge == 100) {
    print("Telefon şarj edildi");
  } else if (charge < 20 && charge >= 10) {
    print("Telefonunuzu şarj edin");
  } else if (charge < 10) {
    print("Kritik batarya seviyesi");
  } else {
    print("Telefon uzaydan geldi herhalde!");
  }

  // Exercise 5
  String favoriteColor = "Mavi";
  generateMessage(name, age, height, favoriteColor);
}

void generateMessage(
    String name, int age, double height, String favoriteColor) {
  String message =
      "Merhaba, ben $name, $age yaşındayım. Boyum $height ve en sevdiğim renk $favoriteColor";
  print(message);
}
