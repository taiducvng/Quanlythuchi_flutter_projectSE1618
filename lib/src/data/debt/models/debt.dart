import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

import '../../../core/enum/debt_type.dart';

part 'debt.g.dart';

@HiveType(typeId: 4)
class Debt extends HiveObject with EquatableMixin {
  @HiveField(1)
  String description;

  @HiveField(7, defaultValue: '')
  String name;

  @HiveField(2)
  double amount;

  @HiveField(3)
  DateTime dateTime;

  @HiveField(4)
  DateTime expiryDateTime;

  @HiveField(5, defaultValue: DebtType.debt)
  DebtType debtType;

  @HiveField(6, defaultValue: 0)
  int? superId;

  Debt({
    required this.description,
    required this.name,
    required this.amount,
    required this.dateTime,
    required this.expiryDateTime,
    required this.debtType,
  });

  @override
  List<Object?> get props => [
        description,
        amount,
        name,
        dateTime,
        expiryDateTime,
        debtType,
      ];
}
