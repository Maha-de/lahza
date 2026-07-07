import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lahza/core/constants/app_text_styles.dart';
import 'package:lahza/features/offers/models/offers_model.dart';

class EndDateTimerWidget extends StatefulWidget {
  final Data item;

  const EndDateTimerWidget({super.key, required this.item});

  @override
  State<EndDateTimerWidget> createState() => _EndDateTimerWidgetState();
}

class _EndDateTimerWidgetState extends State<EndDateTimerWidget> {
  DateTime? endDate;
  late Timer _timer;
  String _timeRemaining = "";

  @override
  void initState() {
    super.initState();
    fetchDateFromApi();
  }

  Future<void> fetchDateFromApi() async {

    setState(() {
      endDate = widget.item.endDate;
    });

    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(minutes: 1), (timer) {
      if (endDate != null) {
        updateTime();
      }
    });
  }

  void updateTime() {
    if (endDate == null) return;

    setState(() {
      Duration diff = endDate!.difference(DateTime.now());
      if (diff.isNegative) {
        _timeRemaining = "انتهى الوقت";
        _timer.cancel();
      } else {
        _timeRemaining =
            "${diff.inDays} يوم، ${diff.inHours % 24} ساعة، ${diff.inMinutes % 60} دقيقة";
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('yyyy/MM/dd – HH:mm').format(endDate!);

    return Column(
      children: [
        Text("ينتهي خلال: $_timeRemaining", style: AppTextStyles.gray14500),
        Text(formattedDate),
      ],
    );
  }
}
