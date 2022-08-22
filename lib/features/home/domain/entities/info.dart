import 'package:equatable/equatable.dart';

class Info extends Equatable {
  const Info({
    required this.count,
    required this.pages,
    required this.next,
    required this.prev,
  });

  final int count;
  final int pages;
  final String? next;
  final String? prev;

  @override
  List<Object?> get props => [
        [
          count,
          pages,
          next,
          prev,
        ]
      ];
}
