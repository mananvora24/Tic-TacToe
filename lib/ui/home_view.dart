import 'package:flutter/material.dart';
import 'package:skyline_template_app/core/utilities/constants.dart';
import 'package:skyline_template_app/viewmodels/home_viewmodel.dart';
import 'package:skyline_template_app/locator.dart';
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
              children: [
                Container(
                  child: Center(child: Text("Skyline Flutter Template",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: kColorSkylineWhite),)),
                ),SizedBox(height: 10,),
                Container(child: Image.asset('assets/SkyLineLogo.png'),),
                ElevatedButton(onPressed: () {
                  viewModel.routeToTeacherView();
                }, style: ElevatedButton.styleFrom(primary: kColorSkyLineGrey, ),child: Text("Teacher View",style: TextStyle(color: kColorSkylineGreen),),)
              ],
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ),
        );

  }
}
