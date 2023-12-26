class UserProfile {
  String userName;
  String email;
  // Add more fields as needed

  UserProfile({
    required this.userName,
    required this.email,
    // Add more fields as needed
  });

  // Factory method to create a UserProfile instance from JSON
  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      userName: json['userName'],
      email: json['email'],
      // Add more fields as needed
    );
  }

  // Method to convert UserProfile instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'email': email,
      // Add more fields as needed
    };
  }
}
