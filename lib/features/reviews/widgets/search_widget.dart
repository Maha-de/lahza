import 'package:flutter/material.dart';
import 'package:lahza/features/reviews/widgets/review_phones_item.dart';

class SearchWidget extends StatefulWidget {
  final List<ReviewPhonesItem> phones;

  final Function(List<ReviewPhonesItem>, bool) onSearch;

  const SearchWidget({super.key, required this.phones, required this.onSearch});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final TextEditingController controller = TextEditingController();

  List<ReviewPhonesItem> result = [];

  bool isSearching = false;

  void search(String value) {
    if (value.trim().isEmpty) {
      widget.onSearch([], false);

      return;
    }

    final query = value.toLowerCase();

    result = widget.phones.where((phone) {
      return phone.title.toLowerCase().contains(query);
    }).toList();

    widget.onSearch(result, true);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: TextField(
            controller: controller,
            onChanged: search,
            decoration: InputDecoration(
              hintText: "ابحث عن هاتف",
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
