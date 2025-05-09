import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// 1) Modelo de comentário
class Comment {
  final int id;
  final String name;
  final String email;
  final String body;

  Comment({
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      body: json['body'],
    );
  }
}

class DetailScreen extends StatelessWidget {
  final int postId;
  const DetailScreen({super.key, required this.postId});

  // 2) Função para buscar comentários
  Future<List<Comment>> fetchComments() async {
    final uri = Uri.parse(
        'https://jsonplaceholder.typicode.com/comments?postId=$postId');
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList
          .map((jsonItem) => Comment.fromJson(jsonItem))
          .toList();
    } else {
      throw Exception('Falha ao carregar comentários');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Post $postId Details')),
      // 3) FutureBuilder para exibir spinner / erro / lista
      body: FutureBuilder<List<Comment>>(
        future: fetchComments(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // enquanto carrega
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // em caso de erro
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (snapshot.data == null || snapshot.data!.isEmpty) {
            // sem comentários
            return const Center(child: Text('Nenhum comentário.'));
          } else {
            // lista de comentários
            final comments = snapshot.data!;
            return ListView.builder(
              itemCount: comments.length,
              itemBuilder: (context, index) {
                final c = comments[index];
                return ListTile(
                  title: Text(c.name),
                  subtitle: Text(c.body),
                );
              },
            );
          }
        },
      ),
    );
  }
}
