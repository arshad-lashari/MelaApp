import 'package:flutter/material.dart';

class BusinessMessagescreen extends StatefulWidget {
  const BusinessMessagescreen({super.key});

  @override
  State<BusinessMessagescreen> createState() => _BusinessMessagescreenState();
}

class _BusinessMessagescreenState extends State<BusinessMessagescreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}