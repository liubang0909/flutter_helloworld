import 'package:flutter/material.dart';

class StepperDemo extends StatefulWidget {
  StepperDemo({Key key}) : super(key: key);

  @override
  _StepperDemoState createState() => _StepperDemoState();
}

class _StepperDemoState extends State<StepperDemo> {
  int _currentStep = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Stepper'),
          elevation: 0,
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Theme(
                // data: Theme.of(context).copyWith(primaryColor: Colors.black),
                data: ThemeData(primaryColor: Colors.black),
                child: Stepper(
                    onStepTapped: (value) {
                      setState(() {
                        _currentStep = value;
                      });
                    },
                    onStepContinue: () {
                      setState(() {
                        _currentStep < 2 ? _currentStep += 1 : _currentStep = 0;
                      });
                    },
                    onStepCancel: () {
                      setState(() {
                        _currentStep > 0 ? _currentStep -= 1 : _currentStep = 0;
                      });
                    },
                    currentStep: _currentStep,
                    steps: [
                      Step(
                          title: Text('login'),
                          subtitle: Text('副标题'),
                          content: Text('第一步'),
                          isActive: _currentStep == 0),
                      Step(
                          title: Text('login1'),
                          subtitle: Text('副标题'),
                          content: Text('第二步'),
                          isActive: _currentStep == 1),
                      Step(
                          title: Text('login2'),
                          subtitle: Text('副标题'),
                          content: Text('第三步'),
                          isActive: _currentStep == 2),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
