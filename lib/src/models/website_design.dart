import 'dart:ui';

import 'package:polypus_app/src/util/util.dart';

class WebsiteDesign {
  Color? primaryColour;
  Color? secondaryColour;
  String? font;
  String? websiteName;
  String? description;
  String? category;

  WebsiteDesign({
    this.primaryColour,
    this.secondaryColour,
    this.font,
    this.websiteName,
    this.description,
    this.category,
  });

  factory WebsiteDesign.fromMap(Map<String, dynamic> map) {
    return new WebsiteDesign(
      primaryColour: HexColor.fromHex(map['Primary_colour']),
      secondaryColour: HexColor.fromHex(map['Secondary_colour']),
      font: map['Font'] as String?,
      websiteName: map['Website_name'] as String?,
      description: map['Description'] as String?,
      category: map['Category'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'Primary_colour': this.primaryColour!.toHex(leadingHashSign: true),
      'Secondary_colour': this.secondaryColour!.toHex(leadingHashSign: true),
      'Font': this.font,
      'Website_name': this.websiteName,
      'Description': this.description,
      'Category': this.category,
    } as Map<String, dynamic>;
  }
}
