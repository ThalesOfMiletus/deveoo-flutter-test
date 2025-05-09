// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onToggleTheme;

  const HomeScreen({
    super.key,
    required this.isDarkMode,
    required this.onToggleTheme,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final posts = List.generate(10, (i) => 'Post ${i + 1}');

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme  = Theme.of(context).textTheme;

    // escolhe conteúdo conforme aba
    Widget body = _selectedIndex == 0
      ? ListView.builder(
          itemCount: posts.length,
          itemBuilder: (_, i) => ListTile(
            title: Text(posts[i], style: textTheme.bodyMedium),
            trailing: Icon(Icons.arrow_forward_ios, size: 16, color: colorScheme.secondary),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => DetailScreen(postId: i + 1)),
            ),
          ),
        )
      : Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name: Thales Martins', style: textTheme.titleLarge),
              const SizedBox(height: 8),
              Text('Email: thales@example.com', style: textTheme.bodyMedium),
              const SizedBox(height: 16),
              Text('Flutter Deveoo Test', style: textTheme.bodyMedium),
            ],
          ),
        );

    return Scaffold(
      appBar: AppBar(
        title: Text(_selectedIndex == 0 ? 'Home' : 'About'),
        actions: [
          // switch para tema claro/escuro
          Switch(
            value: widget.isDarkMode,
            onChanged: widget.onToggleTheme,
            activeColor: colorScheme.secondary,
          )
        ],
      ),
      body: body,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: colorScheme.secondary,
        onTap: (idx) => setState(() => _selectedIndex = idx),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'About'),
        ],
      ),
    );
  }
}
