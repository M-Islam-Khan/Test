import 'package:assignment_2/model.dart';
import 'package:flutter/material.dart';

class EmpDetail extends StatelessWidget {
  final Employees detail;

  const EmpDetail({super.key, required this.detail});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Employee Details",textScaleFactor: 1.2,),
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
          Text("${detail.name}",style: const TextStyle(fontSize: 22,fontWeight: FontWeight.w100),),
          Text(detail.age.toString(),style: const TextStyle(fontSize: 22,fontWeight: FontWeight.w100),),
          Text(detail.salary.toString(),style: const TextStyle(fontSize: 22,fontWeight: FontWeight.w100),),
           ],
        ),
      )
    );
  }
}