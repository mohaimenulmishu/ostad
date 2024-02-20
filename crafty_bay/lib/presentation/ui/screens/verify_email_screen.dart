import 'package:crafty_bay/presentation/ui/widgets/app_logo.dart';
import 'package:flutter/material.dart';
class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
           children: [
             const SizedBox(height: 160,),
             const AppLogo(
               height:88 ,
             ),
             const SizedBox(height: 24,),
             Text("Welcome Back",style: Theme.of(context).textTheme.titleLarge,),
             const SizedBox(height: 4,),
             Text("Please Enter Your Email Address",style: Theme.of(context).textTheme.bodySmall,),
             const SizedBox(height: 16,),
             TextFormField(
               decoration:  InputDecoration(
                 hintText: "Email Address"
               ),
             ),
             const SizedBox(height: 16,),
             SizedBox(
               width: double.infinity,
                 height: 40,
                 child: ElevatedButton(onPressed: (){}, child: const Text("Next"),
                 ),
             ),
           ],
          ),
        ),
      ),
    );
  }
}
