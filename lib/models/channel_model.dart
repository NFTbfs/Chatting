import './coworker_model.dart';

class Channel {
  final String id;
  final String name;
  final List<Coworker> collaborators;
  final String organisation;
  final List<String> hasNotOpen;
  final bool isChannel;
  final bool isPublic;
  final String title;
  final String createdAt;
  final String updatedAt;
  final int unreadMessagesNumber;

  Channel(
      {required this.id,
      required this.name,
      required this.collaborators,
      required this.organisation,
      required this.hasNotOpen,
      required this.isChannel,
      required this.isPublic,
      required this.title,
      required this.createdAt,
      required this.updatedAt,
      this.unreadMessagesNumber = 0});

  // Factory method to create a Channel object from JSON
  factory Channel.fromJson(Map<String, dynamic> json) {
    return Channel(
        id: json['_id'],
        name: json['name'],
        collaborators: List<Coworker>.from(json['collaborators']
            .map((collaborator) => Coworker.fromJson(collaborator))),
        organisation: json['organisation'],
        hasNotOpen: List<String>.from(json['hasNotOpen']),
        isChannel: json['isChannel'],
        isPublic: json['isPublic'],
        title: json['title'] as String,
        createdAt: json['createdAt'] as String,
        updatedAt: json['updatedAt'] as String,
        unreadMessagesNumber: json['unreadMessagesNumber'] as int? ?? 0);
  }

  // Method to convert Channel object to JSON
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'collaborators':
          collaborators.map((collaborator) => collaborator.toJson()).toList(),
      'organisation': organisation,
      'hasNotOpen': hasNotOpen,
      'isChannel': isChannel,
      'isPublic': isPublic,
      'title': title,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'unreadMessagesNumber': unreadMessagesNumber
    };
  }
}
