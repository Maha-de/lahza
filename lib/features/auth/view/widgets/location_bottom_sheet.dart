import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LocationBottomSheet<T> extends StatefulWidget {
  final String title;
  final List<T> items;
  final String Function(T) itemText;
  final void Function(T) onSelected;

  const LocationBottomSheet({
    super.key,
    required this.title,
    required this.items,
    required this.itemText,
    required this.onSelected,
  });

  @override
  State<LocationBottomSheet<T>> createState() => _LocationBottomSheetState<T>();
}

class _LocationBottomSheetState<T> extends State<LocationBottomSheet<T>> {
  final TextEditingController _searchController = TextEditingController();

  late List<T> filteredItems;

  @override
  void initState() {
    super.initState();

    filteredItems = [...widget.items];

    filteredItems.sort(
      (a, b) => widget
          .itemText(a)
          .toLowerCase()
          .compareTo(widget.itemText(b).toLowerCase()),
    );
  }

  void _search(String value) {
    setState(() {
      filteredItems = widget.items.where((item) {
        return widget
            .itemText(item)
            .toLowerCase()
            .contains(value.toLowerCase());
      }).toList();

      filteredItems.sort(
        (a, b) => widget
            .itemText(a)
            .toLowerCase()
            .compareTo(widget.itemText(b).toLowerCase()),
      );
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height * .75,
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            Container(
              width: 55.w,
              height: 5.h,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(50.r),
              ),
            ),

            SizedBox(height: 20.h),

            Text(widget.title, style: Theme.of(context).textTheme.titleLarge),

            SizedBox(height: 20.h),

            TextField(
              controller: _searchController,
              onChanged: _search,
              decoration: InputDecoration(
                hintText: "ابحث...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14.r),
                ),
              ),
            ),

            SizedBox(height: 18.h),

            Expanded(
              child: filteredItems.isEmpty
                  ? const Center(child: Text("لا توجد نتائج"))
                  : Scrollbar(
                      thumbVisibility: true,
                      child: ListView.separated(
                        itemCount: filteredItems.length,
                        separatorBuilder: (_, __) => const Divider(height: 1),
                        itemBuilder: (context, index) {
                          final item = filteredItems[index];

                          return ListTile(
                            title: Text(widget.itemText(item)),
                            trailing: const Icon(Icons.chevron_right),
                            onTap: () {
                              widget.onSelected(item);
                              Navigator.pop(context);
                            },
                          );
                        },
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
