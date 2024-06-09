import 'package:equatable/equatable.dart';

class MyUser extends Equatable {
  const MyUser({
    required this.userId,
    required this.email,
    required this.name,
  });
  final String userId;
  final String email;
  final String name;

  // send data to firebase as a map l2an firebase msh byakhod object
  Map<String, dynamic> toFirebase() => {
        // da ely hayb2a gwa el firestore
        // inside the collection
        'uid': userId,
        'email': email,
        'name': name,
      };

  MyUser fromFirebase(Map<String, dynamic> doc) => MyUser(
        userId: doc['uid'],
        email: doc['email'],
        name: doc['name'],
      );

  // kol el attributes final w ana maslan mehtag a3ml
  // modify ly el attributes dy
  MyUser copyWith({
    String? userId,
    String? email,
    String? name,
  }) {
    return MyUser(
      userId: userId ?? this.userId,
      email: email ?? this.email,
      name: name ?? this.name,
    );
  }

  @override
  List<Object> get props => [userId, email, name];
}
