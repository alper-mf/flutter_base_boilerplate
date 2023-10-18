import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String timeAgoSince() {
    DateTime now = DateTime.now();

    final difference = now.difference(this);
    
    if (difference.inDays >= 365) {
      final years = (difference.inDays / 365).toStringAsFixed(1);
      return '$years years';
    } else if (difference.inDays >= 30) {
      final months = (difference.inDays / 30).floor();
      return '$months months';
    } else if (difference.inDays >= 1) {
      return '${difference.inDays} days';
    } else {
      return '0 days'; 
    }
  }

  String formatDateTimeEuropean() {
    final formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(this);
  }
}