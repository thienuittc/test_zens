import 'package:flutter/material.dart';
import 'package:test_zens/core/view_models/interfaces/icontent_viewmodel.dart';
import 'package:provider/provider.dart';

class Content extends StatelessWidget {
  const Content({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 32, 16, 32),
      child: Consumer<IContentViewModel>(builder: (_, vm, __) {
        return vm.jokeToDisplay != null
            ? Column(
                children: [
                  Text(vm.jokeToDisplay!.content ?? ""),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _CustomButton(
                        color: Colors.blue,
                        title: 'This is Funny!',
                        onTap: () => vm.onLike(true),
                      ),
                      _CustomButton(
                        color: Colors.green,
                        title: 'This is not funny.',
                        onTap: () => vm.onLike(false),
                      ),
                    ],
                  ),
                ],
              )
            : const Text(
                "That's all the jokes for today! Come back another day!");
      }),
    );
  }
}

class _CustomButton extends StatelessWidget {
  const _CustomButton(
      {super.key,
      required this.title,
      required this.onTap,
      required this.color});
  final String title;
  final Function() onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: color,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(title),
          ),
        ),
      ),
    );
  }
}
