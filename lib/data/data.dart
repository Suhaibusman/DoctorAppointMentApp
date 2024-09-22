import 'package:doctor_appointment_app/domain/doctor_model.dart';
import 'package:doctor_appointment_app/utils/constant/image_constant.dart';

List<String> categories = <String>[
  "🔥 All",
  "🤒 Fever️",
  "🤧 Cough",
  "🤢 Nauseated",
  "🦷 Dental",
  "👁️ Eye",
  "👨‍⚕️ General"
];

List<DoctorModel> doctorList = [
  // Fever
  DoctorModel(
    doctorName: "Dr. Jenny Wilson",
    speciality: "Neurologist",
    clinicName: "Vcare Clinic",
    totalReviews: 332,
    about: "Dr. Jenny Wilson is the top most immunologist specialist at Vcare Clinic in London, UK.",
    rating: 4.9,
    experience: "7+ years",
    patients: 120,
    isFav: false,
    doctorImage: ImageConstant.doctorImage2,
  ),
  DoctorModel(
    doctorName: "Dr. John Smith",
    speciality: "General Physician",
    clinicName: "HealthFirst Clinic",
    totalReviews: 150,
    about: "Dr. John Smith specializes in treating various fevers and has a proven track record.",
    rating: 4.8,
    experience: "10+ years",
    patients: 200,
    isFav: false,
    doctorImage: ImageConstant.doctorImage1, // Update with the actual path or constant
  ),

  // Cough
  DoctorModel(
    doctorName: "Dr. Emily Davis",
    speciality: "Pulmonologist",
    clinicName: "Care Center",
    totalReviews: 245,
    about: "Dr. Emily Davis is an expert in respiratory issues and has helped countless patients.",
    rating: 4.7,
    experience: "8+ years",
    patients: 180,
    isFav: false,
    doctorImage: ImageConstant.doctorImage2, // Update with the actual path or constant
  ),

  // Nauseated
  DoctorModel(
    doctorName: "Dr. Michael Brown",
    speciality: "Gastroenterologist",
    clinicName: "Digestive Clinic",
    totalReviews: 320,
    about: "Dr. Michael Brown specializes in digestive disorders and is highly recommended.",
    rating: 4.9,
    experience: "12+ years",
    patients: 300,
    isFav: false,
    doctorImage: ImageConstant.doctorImage3, // Update with the actual path or constant
  ),

  // Dental
  DoctorModel(
    doctorName: "Dr. Sarah Johnson",
    speciality: "Dentist",
    clinicName: "Smile Dental",
    totalReviews: 400,
    about: "Dr. Sarah Johnson is a renowned dentist with expertise in cosmetic dentistry.",
    rating: 4.6,
    experience: "9+ years",
    patients: 250,
    isFav: false,
    doctorImage: ImageConstant.doctorImage4, // Update with the actual path or constant
  ),
  // Eye
  DoctorModel(
    doctorName: "Dr. Esther",
    speciality: "Dentist",
    clinicName: "Smile Dental",
    totalReviews: 280,
    about: "Dr. Esther is a renowned dentist with expertise in cosmetic dentistry.",
    rating: 4.5,
    experience: "7+ years",
    patients: 110,
    isFav: true,
    doctorImage: ImageConstant.doctorImage4, // Update with the actual path or constant
  ),

  // Eye
  DoctorModel(
    doctorName: "Dr. Warren",
    speciality: "Physician",
    clinicName: "Physician Center",
    totalReviews: 280,
    about: "Dr. Warren specializes in Physician, providing excellent services.",
    rating: 4.8,
    experience: "11+ years",
    patients: 220,
    isFav: true,
    doctorImage: ImageConstant.doctorImage3, // Update with the actual path or constant
  ),

  // General
  DoctorModel(
    doctorName: "Dr. Alice Green",
    speciality: "Family Medicine",
    clinicName: "Wellness Clinic",
    totalReviews: 350,
    about: "Dr. Alice Green is a family medicine specialist focusing on overall wellness.",
    rating: 4.7,
    experience: "6+ years",
    patients: 150,
    isFav: false,
    doctorImage: ImageConstant.doctorImage5, // Update with the actual path or constant
  ),
];

List<DoctorModel> favoriteDoctors = doctorList.where((doctor) => doctor.isFav).toList();
