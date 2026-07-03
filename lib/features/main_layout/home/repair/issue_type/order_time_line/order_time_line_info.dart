class OrderTimelineInfo {
  final String title;
  final String time;
  final bool isCompleted;
  final bool isCurrent;

  const OrderTimelineInfo({
    required this.title,
    required this.time,
    this.isCompleted = false,
    this.isCurrent = false,
  });
}
 final timeline = [
  OrderTimelineInfo(
    title: 'تم إنشاء الطلب',
    time: '10:30 ص',
    isCompleted: true,
  ),
  OrderTimelineInfo(
    title: 'تم مراجعة الطلب',
    time: '10:35 ص',
    isCompleted: true,
  ),
  OrderTimelineInfo(
    title: 'تم إرسال المندوب',
    time: '10:40 ص',
    isCompleted: true,
  ),
  OrderTimelineInfo(
    title: 'المندوب في الطريق إليك',
    time: '10:45 ص',
    isCurrent: true,
  ),
  OrderTimelineInfo(
    title: 'تم استلام الجهاز',
    time: '',
  ),
  OrderTimelineInfo(
    title: 'وصل الجهاز إلى مركز الصيانة',
    time: '',
  ),
  OrderTimelineInfo(
    title: 'جاري فحص الجهاز',
    time: '',
  ),
  OrderTimelineInfo(
    title: 'جاري الإصلاح',
    time: '',
  ),
  OrderTimelineInfo(
    title: 'في الطريق إليك',
    time: '',
  ),
  OrderTimelineInfo(
    title: 'تم التسليم',
    time: '',
  ),
];