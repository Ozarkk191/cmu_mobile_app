import 'package:flutter/material.dart';

class LoadingBox2 extends StatelessWidget {
  final Widget? child;
  final bool loading;
  const LoadingBox2({Key? key, this.child, required this.loading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            SizedBox(
              child: child,
            ),
            loading
                ? SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
