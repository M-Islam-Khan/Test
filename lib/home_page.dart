import 'dart:convert';

import 'package:assignment_2/detail.dart';
import 'package:assignment_2/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

 class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Employees>? apiList;
final url = "http://aamras.com/dummy/EmployeeDetails.json";


  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async{
    var result = await http.get(Uri.parse(url));
    final employeejson = result.body;
    final decodeData = jsonDecode(employeejson);
    var employeeData = decodeData['employees'];
    apiList = List.from(employeeData).map((item)=>Employees.fromJson(item)).toList().cast<Employees>();
    
    setState(() {});
    //print(result.body);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const Header(),
            (apiList != null)?
             getList()
             :const Expanded(
               child: Center(
               child: CircularProgressIndicator(color: Colors.white,),
                   ),
             ),
          ],
        ),
      ),
    );
  }

  

  Widget getList(){
    return Expanded(
      child: ListView.builder(
        itemCount: apiList!.length,
        itemBuilder: (context, index) {
          
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             InkWell(
              onTap:() => Navigator.push(context,MaterialPageRoute(builder: (context) => EmpDetail(detail: apiList![index],))),
               child: Container(
                width: double.infinity,
                padding: const EdgeInsets.only(left: 15),
                margin: EdgeInsets.zero,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15,),
                     Text("${apiList![index].name}",style: const TextStyle(fontSize: 22,fontWeight: FontWeight.w100),),
                    Text("${apiList![index].age}",style: const TextStyle(fontSize: 22,fontWeight: FontWeight.w100),),
                    Text("${apiList![index].salary}",style: const TextStyle(fontSize: 22,fontWeight: FontWeight.w100),),
                    const SizedBox(height: 15,),
                    Container(
                      height: 1.1,
                      color: Colors.white,
                      child: const Divider(),
                    ),
                  ],
                )
                         ),
             ),
            
          ],
        );
        }
        ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:   [
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.all(15),
            child:const Text("EmployeeDummy",textScaleFactor: 1.5,), 
          )
           
          
      ],),
    );
    
  }
}

 