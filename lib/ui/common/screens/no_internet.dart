import 'package:cobro_app/helpers/internet.observer/internet_observer.dart';
import 'package:cobro_app/helpers/internet.observer/internet_redirector.dart';
import 'package:cobro_app/ui/common/widgets/buttons/ripple_button.dart';
import 'package:flutter/material.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({super.key});

  static const routeName = 'no_internet';

  

  @override
  Widget build(BuildContext context) {
    return InternetRedirector(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: RippleButton(
            onTap: () {
              InternetObserver.instance.checkStatusComplete();
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Icon(Icons.wifi_off),
                Text('You have no internet connection'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
