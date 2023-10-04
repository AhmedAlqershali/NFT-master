class RegesterModel {
  final String message;
   bool status;

  RegesterModel({
    required this.message,
    required this.status,
  });

  factory RegesterModel.fromJson(Map<String, dynamic> json) {
    return RegesterModel(
      message: json['message'],
      status: json['status'],
    );
  }

  factory RegesterModel.empty() {
    return RegesterModel(status: false ,message: "");
  }


}
