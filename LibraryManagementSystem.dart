import 'dart:io';

abstract class User {
  static int _idCounter = 1000;
  int id;
  String firstName;
  String? middleName;
  String lastName;
  int age;
  String email;
  String password;

  User(this.firstName, this.middleName, this.lastName, this.age, this.email, this.password) : id = _idCounter++;

  void showProfile();
}

class Student extends User {
  Student(super.firstName, super.middleName, super.lastName, super.age, super.email, super.password);

  @override
    void showProfile(){
      print("==================================");
      print('First Name: $firstName');
      print('Middle Name: $middleName');
      print('Last Name: $lastName');
      print('Age: $age');
      print('Email: $email');
    }
}

class Librarian extends User {
  Librarian(super.name, super.middleName, super.lastName, super.age, super.email, super.password);

    @override
    void showProfile(){
      print("==================================");
      print('First Name: $firstName');
      print('Middle Name: $middleName');
      print('Last Name: $lastName');
      print('Age: $age');
      print('Email: $email');
    }
}

class Book {
  String title;
  String author;
  String genre;
  bool isAvailable;

  Book({required this.title, required this.author, required this.genre, required this.isAvailable});

  void showBookInfo(){
    print('Title: $title');
    print('Author: $author');
    print('Genre: $genre');
    String availability = isAvailable ? 'Available' : 'Not Available'; 
    print('Availability: $availability');
  }
}

class Library {
  int totalBooks;
  int availableBook;

  Library({required this.availableBook, required this.totalBooks});

  void showLibraryInfo(){
    print('Total Books $totalBooks');
    print('Available Books: $availableBook');
  }
}

List <Student> students = [];
List <Librarian> librarians = [];
List <Book> books = [];
List <Library> library = [];

void showCreateAccountMenu(){
  while(true){
    print("Create account as?");
    print("===================");
    print("[1] Librarian");
    print("[2] Student");
    print("[0] Back");
    print("===================");
    stdout.write(": ");
    int option = int.parse(stdin.readLineSync()!);
    if(option != 0 && option != 1 && option != 2){
      print("\n\nInvalid option. Please try again\n");
    } else if(option == 0){
      break;
    } else if(option == 1){
      librarianSignUp();
      librarianLogin();
      return;
    } else if (option == 2){
      studentSignUp();
      studentLogin();
      return;
    }
  }
}

void showLoginMenu(){
  while(true){
    print("\n===================");
    print("\tLogin as");
    print("===================");
    print("[1] Librarian");
    print("[2] Student");
    print("[0] Back to main menu");
    print("\n===================");
    stdout.write(": ");
    int choice = int.parse(stdin.readLineSync()!);

    if(choice != 0 && choice != 1 && choice != 2){
      print("Invalid choice, Please try again");
    } else {
      switch(choice){
        case 0:
                return;
        case 1:
                librarianLogin();
                return;
        case 2: 
                studentLogin();
                return;        
      }
    }
  }   
}

void librarianSignUp(){
  print("\n===================");
  print("\tSign up");
  print("===================");
  stdout.write("Name: ");
  String firstName = stdin.readLineSync()!;
  stdout.write("Middle Name: ");
  String? middleName = stdin.readLineSync();
  stdout.write("Last Name: ");
  String lastName = stdin.readLineSync()!;
  stdout.write("Age: ");
  int age = int.parse(stdin.readLineSync()!);
  stdout.write("Email: ");
  String email = stdin.readLineSync()!;
  stdout.write("Password: ");
  String password = stdin.readLineSync()!;

  Librarian librarian = Librarian(firstName, middleName, lastName, age, email, password);
  librarians.add(librarian);

  print("\nAccount created successfully");
  print("Librarian Id: ${librarian.id}");
  print("\n");
}

void studentSignUp(){
  print("\n===================");
  print("\tSign up");
  print("===================");
  stdout.write("Name: ");
  String firstName = stdin.readLineSync()!;
  stdout.write("Middle Name: ");
  String? middleName = stdin.readLineSync();
  stdout.write("Last Name: ");
  String lastName = stdin.readLineSync()!;
  stdout.write("Age: ");
  int age = int.parse(stdin.readLineSync()!);
  stdout.write("Email: ");
  String email = stdin.readLineSync()!;
  stdout.write("Password: ");
  String password = stdin.readLineSync()!;

  Student student = Student(firstName, middleName, lastName, age, email, password);
  students.add(student);

  print("\nAccount created successfully!");
  print("Student ID: ${student.id}");
  print("\n");
}

void librarianLogin(){
  outerLoop:
  while(true){
    print("\n===================");
    print("Librarian Login");
    print("===================");
    print("[1] Login");
    print("[0] Back to main menu");
    print("===================");
    stdout.write(": ");
    int choice = int.parse(stdin.readLineSync()!);
    if(choice != 0 && choice != 1){
      print("\nInvalid option, Please try again\n");
    } else if (choice == 0){
      return;
    } else {
      stdout.write("Librarian ID: ");
      int librarianId = int.parse(stdin.readLineSync()!);
      stdout.write("Password: ");
      String pass = stdin.readLineSync()!;

      for(var librarian in librarians){
        if(librarian.id == librarianId && librarian.password == pass){
          librarianMenu(librarianId);
          continue outerLoop;
        }
      }

      print("\nIncorrect Id or password, Please try again\n");
    }
  }
}

void studentLogin(){
  while(true){
    print("\n===================");
    print("Student Login");
    print("===================");
    print("[1] Login");
    print("[0] Back to main menu");
    print("===================");
    stdout.write(": ");
    int choice = int.parse(stdin.readLineSync()!);

    if(choice != 0 && choice != 1){
      print("\nInvalid option, Please try again\n");
    } else if (choice == 0){
      return;
    } else {
      stdout.write("Student ID: ");
      int studentId = int.parse(stdin.readLineSync()!);
      stdout.write("Password: ");
      String pass = stdin.readLineSync()!;

      for(var student in students){
        if(student.id == studentId && student.password == pass){
          studentMenu(studentId);
          return;
        } 
      }

      print("\nIncorrect Id or password, Please try again\n");
    }
  }
}

void studentMenu(int id){
  while(true){
    print("\n\n==================================");
    print("\tStudent Menu");
    print("==================================");
    print("[1] Profile");
    print("[2] Borrow Book/s");
    print("[3] Book/s Borrowed");
    print("[4] Return Book");
    print('[0] Logout');
    print("==================================");  
    stdout.write(": ");
    int choice = int.parse(stdin.readLineSync()!);

    if(choice != 0 && choice != 1 && choice != 2 && choice != 3 && choice != 4){
      print("\nInvalid option, Please try again.\n");
    } else {
      switch(choice){
        case 0:
          return;
        case 1:
          print("\n==================================");
          print("\tProfile");
          for(var student in students){
            if(student.id == id){
              student.showProfile();
            }
          }  
          break;
      }
    }
  }
 
}

void librarianMenu(int id){
  outerLoop:
  while(true){
    print("\n\n==================================");
    print("\tLibrarian Menu");
    print("==================================");
    print("[1] Profile");
    print("[2] Students");
    print("[3] Total Book/s Borrowed");
    print("[4] Add book");
    print('[0] Logout');
    print("==================================");  
    stdout.write(": ");
    int choice = int.parse(stdin.readLineSync()!);

    if(choice != 0 && choice != 1 && choice != 2 && choice != 3 && choice != 4){
      print("\nInvalid option, Please try again.\n");
    } else {
      switch(choice){
        case 0: 
          return;
        case 1:
          print("\n==================================");
          print("\tProfile");
          for (var librarian in librarians) {
            if(librarian.id == id){
              librarian.showProfile();
            }
          }
          break; 
        case 2:
          if(students.isEmpty){
            print("\nNo student/s registered as of the moment\n");
            continue outerLoop;
          }
          print("\n==================================");
          print("Student/s");
          for (var student in students) {
            student.showProfile();
          }
          break;
        case 3:
          //total books borrowed function to be follow
          break;
        case 4:
          stdout.write("Title: ");
          String title = stdin.readLineSync()!;
          stdout.write("Author: ");
          String author = stdin.readLineSync()!; 
          stdout.write("Genre: ");
          String genre = stdin.readLineSync()!;
          stdout.write("Is available (true or false): ");
          String isAvailableInput = stdin.readLineSync()!; 
          bool isAvailable;
          if(isAvailableInput == "true"){isAvailable = true;}else{isAvailable = false;}
          Book book = Book(title: title, author: author, genre: genre, isAvailable: isAvailable);
          books.add(book);

          print("\nBook added successfully\n");
          break;
      }
    }
  }
}

void main(){
  int? choice;

  //main menu
  do {
    print("\n\n==================================");
    print("\tWhat would you like to do?");
    print("==================================");
    print("[1] Create Account");
    print("[2] Login");
    print("[0] Exit");
    print("==================================");
    stdout.write(": ");
    choice = int.parse(stdin.readLineSync()!);

    if(choice != 0 && choice != 1 && choice != 2){
      print("\n\nInvalid Choice (Choose between 0, 1, 2)");
    } else {
      if(choice == 0){
        print("\nExiting the program...\n");
        exit(0);
      } else if(choice == 1){
        showCreateAccountMenu();
      } else if(choice == 2){
        showLoginMenu();
      }
    }
  } while (choice != null);
}