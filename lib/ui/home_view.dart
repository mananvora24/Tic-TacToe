import 'package:flutter/material.dart';
import 'package:cut_my_carbon/core/utilities/constants.dart';
import 'package:cut_my_carbon/viewmodels/home_viewmodel.dart';
import 'package:cut_my_carbon/locator.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      disposeViewModel: false,
      viewModelBuilder: () => locator<HomeViewModel>(),
      onModelReady: (viewModel) => viewModel.init(),
      builder: (context, viewModel, child) => Scaffold(
            backgroundColor: kColorSkylineGreen,
            body: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Center(child: Text("Skyline Flutter Template",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: kColorSkylineWhite),)),
              ],
            ),
          ),
        );

  }
}
