
class Util{

  static bool isEmailValid(String email) {

    RegExp regex = new RegExp('.+@.+\\.[a-z A-Z]+');
    return regex.hasMatch(email);
  }
}

main() {
  var ok = Util.isEmailValid('felipe@milicom.o');

  print(ok);



}