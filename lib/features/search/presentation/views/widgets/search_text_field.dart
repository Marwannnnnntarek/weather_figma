import 'package:flutter/material.dart';
import 'package:myapp/features/home/presentation/views/widgets/home_view_body.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    required TextEditingController searchController,
  }) : _searchController = searchController;

  final TextEditingController _searchController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: 'Enter city name',
          prefixIcon: Icon(Icons.search),
          border: InputBorder.none,
        ),
        onSubmitted: (value) {
          if (value.trim().isNotEmpty) {
           
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeViewBody(cityName: value.trim()),
              ),
            );
          }
        },
      ),
    );
  }
}
