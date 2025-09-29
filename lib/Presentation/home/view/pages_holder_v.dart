import 'package:flutter/material.dart';
import 'package:moatmat_uploader/Core/resources/colors_r.dart';

import '../../banks/views/add_bank_view.dart';
import '../../banks/views/my_banks_v.dart';

class PagesHolderView extends StatefulWidget {
  const PagesHolderView({super.key});

  @override
  State<PagesHolderView> createState() => _PagesHolderViewState();
}

class _PagesHolderViewState extends State<PagesHolderView> {
  // Showing only banks; removed PageView and BottomNavigationBar.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsResources.background,
      body: MyBanksView(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).push(
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const AddBankView(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                final slide = Tween<Offset>(
                  begin: const Offset(0.0, 0.1),
                  end: Offset.zero,
                )
                    .chain(CurveTween(curve: Curves.easeOutCubic))
                    .animate(animation);

                final fade = CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeOut,
                );

                return FadeTransition(
                  opacity: fade,
                  child: SlideTransition(
                    position: slide,
                    child: child,
                  ),
                );
              },
              transitionDuration: const Duration(milliseconds: 250),
              reverseTransitionDuration: const Duration(milliseconds: 200),
            ),
          );
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
