// full_name_input.dart
import 'dart:io';

void main() {
  // Ask user for first name
  stdout.write("Enter your first name: ");
  String firstName = stdin.readLineSync()!;

  // Ask user for last name
  stdout.write("Enter your last name: ");
  String lastName = stdin.readLineSync()!;

  // // Check for null inputs
  // if (firstName == null || lastName == null) {
  //   print("Invalid input!");
  //   return;
  // }

  // Call the function
  String fullName = getFullName(firstName, lastName);

  // Display the result
  print("\nYour full name is: $fullName");
}

// Function to return full name
String getFullName(String firstName, String lastName) {
  return "$firstName $lastName";
}
