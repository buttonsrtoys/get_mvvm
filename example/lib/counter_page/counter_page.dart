import 'package:example/counter_page/counter_page_view_model.dart';
import 'package:example/increment_button/increment_button.dart';
import 'package:example/services/color_notifier.dart';
import 'package:flutter/material.dart';
import 'package:view/view.dart';

class CounterPage extends View<CounterPageViewModel> {
  CounterPage({
    required this.title,
    super.key,
  }) : super(
          viewModelBuilder: () => CounterPageViewModel(),
          registerViewModel: true, // <- makes gettable with View.get (overkill for this simple example)
        );

  final String title;

  @override
  Widget build(BuildContext context) {
    final colorNotifier = View.get<ColorNotifier>();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(viewModel.message),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  viewModel.lowercaseCounter,
                  style: TextStyle(fontSize: 64, color: colorNotifier.color),
                ),
                Text(
                  '${viewModel.numberCounter}',
                  style: TextStyle(fontSize: 64, color: viewModel.numberColor),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: IncrementButton(
        // Typically view models are referenced with the "viewModel" member, like this:
        onIncrementNumber: () => viewModel.incrementNumberCounter(),
        // Alternatively, view models can be registered and retrieved with "View.get" (see below). That is overkill for
        // this simple example as "viewModel" is available but, hey, we're demoing! :)
        onIncrementLetter: () => View.get<CounterPageViewModel>().incrementLetterCounter(),
      ),
    );
  }
}
