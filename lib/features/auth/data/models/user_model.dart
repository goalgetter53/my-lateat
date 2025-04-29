import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String email;
  final String? displayName;
  final String? photoUrl;
  final String? uid;
  final String provider; // 'google' or 'email'
  final DateTime createdAt;
  final String? selectedCountry;

  const User({
    required this.id,
    required this.email,
    this.displayName,
    this.photoUrl,
    this.uid,
    required this.provider,
    required this.createdAt,
    this.selectedCountry,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'displayName': displayName,
      'photoUrl': photoUrl,
      'uid': uid,
      'provider': provider,
      'createdAt': Timestamp.fromDate(createdAt),
      'selectedCountry': selectedCountry,
    };
  }

  factory User.fromMap(String id, Map<String, dynamic> map) {
    return User(
      id: id,
      email: map['email'] as String,
      displayName: map['displayName'] as String?,
      photoUrl: map['photoUrl'] as String?,
      uid: map['uid'] as String?,
      provider: map['provider'] as String,
      createdAt: (map['createdAt'] as Timestamp).toDate(),
      selectedCountry: map['selectedCountry'] as String?,
    );
  }

  User copyWith({
    String? id,
    String? email,
    String? displayName,
    String? photoUrl,
    String? uid,
    String? provider,
    DateTime? createdAt,
    String? selectedCountry,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      displayName: displayName ?? this.displayName,
      photoUrl: photoUrl ?? this.photoUrl,
      uid: uid ?? this.uid,
      provider: provider ?? this.provider,
      createdAt: createdAt ?? this.createdAt,
      selectedCountry: selectedCountry ?? this.selectedCountry,
    );
  }

  @override
  List<Object?> get props => [
        id,
        email,
        displayName,
        photoUrl,
        uid,
        provider,
        createdAt,
        selectedCountry,
      ];
}