import 'package:flutter/material.dart';
import 'package:test_zens/core/view_models/interfaces/icontent_viewmodel.dart';
import 'package:provider/provider.dart';
import 'widgets/content.dart';
import 'widgets/footer.dart';
import 'widgets/header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late IContentViewModel iContentViewModel;
  @override
  void initState() {
    iContentViewModel = context.read<IContentViewModel>();
    Future.delayed(Duration.zero, () async {
      await iContentViewModel.init();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: const IntrinsicHeight(
                child: Column(
                  children: [
                    CustomHeader(),
                    Expanded(
                      child: Content(),
                    ),
                    CustomFooter(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
    ;
  }
}
