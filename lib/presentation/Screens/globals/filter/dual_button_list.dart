import 'package:flutter/material.dart';

class DualButtonList extends StatefulWidget {
  final List<String> filters;
  const DualButtonList({super.key, required this.filters});

  @override
  _DualButtonListState createState() => _DualButtonListState();
}

class _DualButtonListState extends State<DualButtonList> {

  Set<int> selectedFilterIndices = Set();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: widget.filters.asMap().entries.map((MapEntry<int, String> entry) {
        final int index = entry.key;
        final String filter = entry.value;

        return Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: FilterButton(
            filter: filter,
            isSelected: selectedFilterIndices.contains(index),
            onPressed: () {
              setState(() {
                if (selectedFilterIndices.contains(index)) {
                  selectedFilterIndices.remove(index);
                } else {
                  selectedFilterIndices.add(index);
                }
              });
            },
          ),
        );
      }).toList(),
    );
  }
}

class FilterButton extends StatelessWidget {
  final String filter;
  final bool isSelected;
  final VoidCallback onPressed;

  const FilterButton({
    super.key,
    required this.filter,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor:
            isSelected ? Theme.of(context).primaryColor : Colors.grey,
      ),
      child: Text(filter),
    );
  }
}
