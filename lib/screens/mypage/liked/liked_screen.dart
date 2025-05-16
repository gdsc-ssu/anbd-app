import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:anbd/data/dto/response/share_post_response.dart';
import 'package:anbd/widgets/product_item.dart';
import 'package:anbd/screens/home/home_viewmodel.dart'; // HomeViewModel에서 post 리스트 사용

class LikedScreen extends StatelessWidget {
  const LikedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();
    final likedPosts = viewModel.products.where((post) => post.isLiked).toList();

    return Scaffold(
      appBar: AppBar(title: const Text("관심 목록")),
      body: likedPosts.isEmpty
          ? const Center(child: Text("관심 목록이 비어 있습니다."))
          : ListView.builder(
        itemCount: likedPosts.length,
        itemBuilder: (context, index) => ProductItem(product: likedPosts[index]),
      ),
    );
  }
}
