class PrescriptionMedicine {
  String nameOfMedicine;

  PrescriptionMedicine({this.nameOfMedicine});

  static List<PrescriptionMedicine> tempPrescription = [
    PrescriptionMedicine(
      nameOfMedicine: 'Pain Relief',
    ),
    PrescriptionMedicine(
      nameOfMedicine: 'Stomach Pain',
    ),
    PrescriptionMedicine(
      nameOfMedicine: 'Cough and Cold',
    ),
    PrescriptionMedicine(
      nameOfMedicine: 'Headache',
    )
  ];
}
