import 'package:flutter/material.dart';
import 'package:anbd/widgets/search_text_field.dart';
import 'package:anbd/data/dto/response/share_post_response.dart';
import 'package:anbd/widgets/product_item.dart';

class SearchScreen extends StatefulWidget {
  final List<SharePostResponse> allPosts;

  const SearchScreen({super.key, required this.allPosts});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String _query = '';
  List<SharePostResponse> _filteredPosts = [];

  void _onBackPressed() {
    Navigator.pop(context);
  }

  void _onSearchChanged(String value) {
    setState(() {
      _query = value;
      _filteredPosts = widget.allPosts
          .where((post) =>
      post.title?.toLowerCase().contains(value.toLowerCase()) ?? false)
          .toList();
    });
  }

  void _onSubmitted(String value) {
    // 선택적으로 서버 API 검색도 가능
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SearchTextField(
              hintText: "근처에서 검색",
              onBackPressed: _onBackPressed,
              onSearchChanged: _onSearchChanged,
              onSubmitted: _onSubmitted,
            ),
            const SizedBox(height: 8),
            Expanded(
              child: _query.isEmpty
                  ? const SizedBox()
                  : _filteredPosts.isEmpty
                  ? const Center(child: Text("검색 결과가 없습니다."))
                  : ListView.builder(
                itemCount: _filteredPosts.length,
                itemBuilder: (context, index) {
                  return ProductItem(product: _filteredPosts[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
