abstract class Vechile{

  String? a;

  prints();
}



class All extends Vechile{
  @override
  prints() {
    print('object');
  }
}




class Cars{
  String? name;
  int? _age;
  String? _birthday;
  int? _birthYear;
  int? _deathYear;
  int get age=> _age!;
  int get birthYear => _birthYear!;
  int get deathYear => _deathYear!;
  String get birthday => _birthday!;
  void setAge(int age){
    if(age == 0){
      print('please select age greather than 5');
      throw Exception('Age cannot be 0');
    }
    _age = age;
  }
  void setBirthYear(int year){
    _birthYear = year;
}
  void setDeathYear(int year){
    _deathYear = year;
  }
  String getBirthDay(){
    if(_birthYear == null){
      throw Exception('please input the birthyear first');
    }
    if(_deathYear == null){
      _birthday = "More nai ekhono";
    }
    if(_birthYear!= null && _deathYear!=null){
      int day = _deathYear! - _deathYear!;
      _birthday = "Birthday: $day";
    }
    return _birthday!;
  }
}