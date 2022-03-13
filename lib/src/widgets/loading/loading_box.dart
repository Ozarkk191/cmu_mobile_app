import 'package:flutter/material.dart';

class LoadingBox extends StatelessWidget {
  final Widget? child;
  final bool loading;
  const LoadingBox({Key? key, this.child, required this.loading})
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
                ? Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: const Color(0xfffbd4b9),
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
