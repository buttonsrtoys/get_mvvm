import 'package:example/counter_page/counter_page_view_model.dart';
import 'package:example/increment_button/increment_button.dart';
import 'package:example/services/color_notifier.dart';
import 'package:flutter/material.dart';
import 'package:registrar/registrar.dart';
import 'package:mvvm_plus/mvvm_plus.dart';

class CounterPage extends View<CounterPageViewModel> {
  CounterPage({
    required this.title,
    super.key,
  }) : super(
            viewModelBuilder: () => CounterPageViewModel(
                  register: true, // <- makes gettable by other widgets (overkill for this simple example)
                ));

  final String title;

  @override
  Widget build(BuildContext context) {
    final upperCaseColorNotifier = Registrar.get<ColorNotifier>();

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
                  viewModel.letterCount.value,
                  style: TextStyle(fontSize: 64, color: upperCaseColorNotifier.color),
                ),
                Text(
                  viewModel.numberCounter.toString(),
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
        onIncrementLetter: () => Registrar.get<CounterPageViewModel>().incrementLetterCounter(),
      ),
    );
  }
}
