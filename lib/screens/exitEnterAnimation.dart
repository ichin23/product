import 'package:flutter/material.dart';

class EnterExitRoute extends PageRouteBuilder {
  final Widget enterPage;
  final Widget exitPage;
  EnterExitRoute({required this.exitPage, required this.enterPage})
      : super(
          transitionDuration: Duration(milliseconds: 800),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              enterPage,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              Stack(
            children: <Widget>[
              SlideTransition(
                position: new Tween<Offset>(
                  begin: const Offset(0.0, 0.0),
                  end: const Offset(-1.0, 0.0),
                ).animate(animation),
                child: exitPage,
              ),
              SlideTransition(
                position: new Tween<Offset>(
                  begin: const Offset(1.0, 0.0),
                  end: Offset.zero,
                ).animate(animation),
                child: enterPage,
              )
            ],
          ),
        );
}



// PageRouteBuilder(
                                  //   reverseTransitionDuration:
                                  //       Duration(milliseconds: 2000),
                                  //   transitionDuration:
                                  //       Duration(milliseconds: 2000),
                                  //   pageBuilder: (context, animation,
                                  //           secondaryAnimation) =>
                                  //       SegundaProduto(
                                  //           produtoSendoCadastrado: produto),
                                  //   transitionsBuilder: (context, animation,
                                  //       secondaryAnimation, child) {
                                  //     var begin = Offset(2.0, 1.0);
                                  //     var end = Offset.zero;
                                  //     var curve = Curves.ease;
                                  //     Tween tuin = Tween(begin: 2, end: 3);

                                  //     var tween = Tween(begin: begin, end: end)
                                  //         .chain(CurveTween(curve: curve));

                                  //     return SlideTransition(
                                  //       position: animation.drive(Tween(
                                  //               begin: Offset(2, 1),
                                  //               end: Offset.zero)
                                  //           .chain(CurveTween(
                                  //               curve: Curves.elasticIn))),
                                  //       child: child,
                                  //     );
                                  //   },
                                  // ),