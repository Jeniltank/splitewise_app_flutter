// class Group {
//   final String groupName;
//   final String groupType;
//
//   Group({
//     required this.groupName,
//     required this.groupType,
//   });
//
//   Group.fromJson(Map<String, Object?> json)
//       : this(
//             groupName: json['groupName'] as String,
//             groupType: json['groupType']! as String);
//
//   Group copywith({
//     String? groupName,
//     bool? groupType,
//   }) {
//     return Group(
//       groupName: groupName ?? this.groupName,
//       groupType: groupType ?? this.groupType,
//       // createdOn: createdOn ?? this.createdOn,
//       // updatedOn: updatedOn ?? this.updatedOn,
//     );
//   }
//
//   Map<String, Object> toJson() {
//     return {
//       'groupName': 'groupName',
//       'groupType': 'groupType',
//     };
//   }
// }
// class Group {
//   final String groupName;
//   final String groupType;
//
//   Group({
//     required this.groupName,
//     required this.groupType,
//   });
//
//   // Correcting the fromJson method
//   Group.fromJson(Map<String, Object?> json)
//       : this(
//           groupName: json['groupName'] as String,
//           groupType: json['groupType'] as String, // Cast to String, not bool
//         );
//
//   Group copyWith({
//     String? groupName,
//     String? groupType, // Change bool to String
//   }) {
//     return Group(
//       groupName: groupName ?? this.groupName,
//       groupType: groupType ?? this.groupType,
//     );
//   }
//
//   Map<String, Object?> toJson() {
//     return {
//       'groupName': groupName, // Use actual value, not string literal
//       'groupType': groupType, // Use actual value, not string literal
//     };
//   }
// }
// class Group {
//   String groupId;
//   String groupName;
//   String groupType;
//   String creatorUserId;
//
//   Group({
//     required this.groupId,
//     required this.groupName,
//     required this.groupType,
//     required this.creatorUserId,
//   });
//
//   // late String groupId;
//   // late String groupName;
//   // late String groupType;
//   // late String creatorUserId; // Add this field
//   //
//   // Group({
//   //   required this.groupId,
//   //   required this.groupName,
//   //   required this.groupType,
//   //   required this.creatorUserId,
//   // });
//
//   // Add the fromJson method to parse JSON data into a Group object
//   factory Group.fromJson(Map<String, dynamic> json) {
//     return Group(
//       groupId: json['groupId'] as String,
//       groupName: json['groupName'] as String,
//       groupType: json['groupType'] as String,
//       creatorUserId: json['creatorUserId'] as String, // Parse creatorUserId
//     );
//   }
//
//   // Add the toJson method to convert a Group object into a JSON map
//   Map<String, dynamic> toJson() {
//     return {
//       'groupId': groupId,
//       'groupName': groupName,
//       'groupType': groupType,
//       'creatorUserId': creatorUserId, // Include creatorUserId in the JSON map
//     };
//   }
//
//   Map<String, dynamic> toMap() {}
// }

// class Group {
//   String groupName;
//   String groupType;
//   String creatorUserId;
//   String groupId;
//
//   // Constructor
//   Group({
//     required this.groupName,
//     required this.groupType,
//     required this.creatorUserId,
//     required this.groupId,
//     required List<String> groupMembers,
//   });
//
//   get groupMembers => null;
//
//   // Convert Group object to a map
//   Map<String, dynamic> toMap() {
//     return {
//       'groupName': groupName,
//       'groupType': groupType,
//       'creatorUserId': creatorUserId,
//       'groupId': groupId,
//     };
//   }
//
// //Add the fromJson method to parse JSON data into a Group object
//   factory Group.fromJson(Map<String, dynamic> json) {
//     return Group(
//       groupId: json['groupId'] as String,
//       groupName: json['groupName'] as String,
//       groupType: json['groupType'] as String,
//       creatorUserId: json['creatorUserId'] as String,
//       groupMembers: [], // Parse creatorUserId
//     );
//   }
// }

class Group {
  String? groupId;
  String groupName;
  String groupType;
  String creatorUserId;
  List<String> groupMembers;

  Group({
    this.groupId,
    required this.groupName,
    required this.groupType,
    required this.creatorUserId,
    required this.groupMembers,
  });

  Map<String, dynamic> toJson() {
    return {
      'groupId': groupId,
      'groupName': groupName,
      'groupType': groupType,
      'creatorUserId': creatorUserId,
      'groupMembers': groupMembers,
    };
  }
}
