class Validators {
  static bool validateInputs(
      String firstName, String surname, String phoneNumber, String? country, String? city) {
    return firstName.isNotEmpty &&
        surname.isNotEmpty &&
        phoneNumber.isNotEmpty &&
        country != null &&
        city != null;
  }
}
