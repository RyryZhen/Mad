// full_name.dart
void main() {
  // Example input
  String firstName = "Ryan";
  String lastName = "Fernandez";

  // Call the function
  String fullName = getFullName(firstName, lastName);

  // Display the result
  print("Full Name: $fullName");
}

// Function that combines first and last name
String getFullName(String firstName, String lastName) {
  return "$firstName $lastName";
}
