import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';


void main() {
  runApp( MyApp());

}

class DisableButtonDemo extends StatefulWidget {
  const DisableButtonDemo({Key? key}) : super(key: key);
  @override
  State<DisableButtonDemo> createState() => _DisableButtonDemoState();
}
class _DisableButtonDemoState extends State<DisableButtonDemo> {
  final myController = TextEditingController();
  bool submit = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myController.addListener(() {
      setState(() {
        submit = myController.text.isNotEmpty;
      });
    });
  }
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return   ElevatedButton(
        onPressed: submit ? () => submitData : null,
    child: Text('Submit',
            style: TextStyle(fontSize: 24))
    );
  }
  submitData(){}

  }



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,

          body: Center(
              child:Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                CircleAvatar(
                radius: 70,
                  backgroundColor: Colors.cyan,
                  backgroundImage: AssetImage('images/5521112.png'),),
                  Text('Mobilciler KOnseyi',
                      style:TextStyle(color: Colors.black,
                          fontSize: 15.0)),
                  LogIn()
          ]),



      ),),);

  }
}





class LogIn extends StatefulWidget {

  @override
  _LogIn createState() => _LogIn();
}
class _LogIn extends State<LogIn> {
  var seciliButon;
  final _formKey=GlobalKey<FormState>();
  var email,pssw;
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: 'User Name',
              labelText: 'Enter your User Name'
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty || value.length<5 || value.length>12) {
                return 'Please enter some text';
              }
              return null;
            },onChanged: (email){
            setState(() {
              email=email;

            });
      },
          ),
          SizedBox(height: 15),
          TextFormField(


              decoration: const InputDecoration(

              hintText: 'Password',
              labelText: 'Enter your password'
            ),
            validator: (String? value) {

              if (value == null || value.isEmpty || value.length<8 || !value.contains(RegExp(r'[A-Za-z]' )) || !value.contains(RegExp(r'[0-9]' )) || !value.contains(RegExp(r'[^a-zA-Z0-9_]' )) ) {
                return 'Please enter some password';
              }
              return null;
            },
            onChanged: (pssw){
              setState(() {
                pssw=pssw;

              });
            },
          ),
          TextButton(
              onPressed: (){
                setState((){ seciliButon="Log In";

                });
                    },
            child: Container(
              width: 50,
              height: 30,
              color: seciliButon=="Log In" ? Colors.blueGrey:Colors.blueAccent,
              child: Text("Log In"),


          ),
          )

    ]),);
  }


}