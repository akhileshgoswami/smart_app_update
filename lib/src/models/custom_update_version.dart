/// Model matching your existing API contract.
class CustomUpdateVersion {
  final String? newVersion;
  final String? redirectLink;

  CustomUpdateVersion({this.newVersion, this.redirectLink});

  factory CustomUpdateVersion.fromJson(Map<String, dynamic> json) {
    return CustomUpdateVersion(
      newVersion:
          json['newVersion'] as String? ?? json['new_version'] as String?,
      redirectLink:
          json['redirectLink'] as String? ?? json['redirect_link'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'newVersion': newVersion,
        'redirectLink': redirectLink,
      };
}
