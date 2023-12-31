import 'package:admin/responsive.dart';
import 'package:admin/screens/dashboard/proyek_dashboard_screen.dart';
import 'package:flutter/material.dart';

import 'components/side_menu.dart';

class ProyekScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenu(),
              ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: LayarDasborProyek(),
            ),
          ],
        ),
      ),
    );
  }
}
