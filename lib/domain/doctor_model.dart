class DoctorModel {
  final String doctorName;
  final String speciality;
  final String clinicName;
  final int totalReviews;
  final String about;
  final double rating;
  final String experience;
  final int patients;
  final bool isFav;
  final String doctorImage; // Use String to represent the image constant

  DoctorModel({
    required this.doctorName,
    required this.speciality,
    required this.clinicName,
    required this.totalReviews,
    required this.about,
    required this.rating,
    required this.experience,
    required this.patients,
    required this.isFav,
    required this.doctorImage,
  });

  // Factory method to create a DoctorModel from JSON
  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      doctorName: json['doctorName'],
      speciality: json['speciality'],
      clinicName: json['clinicName'],
      totalReviews: json['totalReviews'],
      about: json['about'],
      rating: json['rating'].toDouble(),
      experience: json['experience'],
      patients: json['patients'],
      isFav: json['isFav'],
      doctorImage: json['doctorImage'],
    );
  }

  // Method to convert DoctorModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'doctorName': doctorName,
      'speciality': speciality,
      'clinicName': clinicName,
      'totalReviews': totalReviews,
      'about': about,
      'rating': rating,
      'experience': experience,
      'patients': patients,
      'isFav': isFav,
      'doctorImage': doctorImage,
    };
  }
}
