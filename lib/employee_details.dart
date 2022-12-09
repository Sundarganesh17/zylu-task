import 'package:flutter/material.dart';

class EmployeeDetailScreen extends StatelessWidget {
  static const routeName = '/Detailscreen';
  String id;
  String imgurl;
  String name;
  String companyname;
  String position;
  String experience;
  String qualification;
  EmployeeDetailScreen(this.id, this.imgurl, this.name, this.companyname,
      this.position, this.experience, this.qualification);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:const Color.fromARGB(255, 21, 87, 141),
        title:const Text('Details',style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Spacer(),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: ClipRRect(
                borderRadius:const BorderRadius.all(Radius.circular(30)),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                Hero(tag: id, child: Image.network(imgurl)),
                Container(
                  height: 40,
                  width: double.infinity,
                  color: Colors.black54,
                  child: Center(
                      child: Text(
                    name,
                    style:const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  )),
                )
                  ],
                )),
          ),
        const   SizedBox(
            height: 30,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                elevation: 0,
                // color:Color.fromARGB(255, 227, 249, 186) ,
                child: Text.rich(TextSpan(
                    style:const TextStyle(fontSize: 20, color: Colors.black87),
                    children: [
                     const TextSpan(text: 'Company        :        '),
                      TextSpan(text: companyname)
                    ])),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 60),
                child: Card(
                  elevation: 0,
                  // color:Color.fromARGB(255, 227, 249, 186) ,
                  child: Text.rich(TextSpan(
                      style:const TextStyle(fontSize: 20, color: Colors.black87),
                      children: [
                       const TextSpan(text: 'Position           :   '),
                        TextSpan(text: position)
                      ])),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Card(
                elevation: 0,
                // color:Color.fromARGB(255, 227, 249, 186) ,
                child: Text.rich(TextSpan(
                    style:const TextStyle(fontSize: 20, color: Colors.black87),
                    children: [
                    const  TextSpan(text: 'Experience         :      '),
                      TextSpan(text: experience)
                    ])),
              ),
              const SizedBox(
                height: 15,
              ),
              Card(
                elevation: 0,
                // color:Color.fromARGB(255, 227, 249, 186) ,
                child: Text.rich(TextSpan(
                    style:const TextStyle(fontSize: 20, color: Colors.black87),
                    children: [
                     const TextSpan(text: 'Qualification       :      '),
                      TextSpan(text: qualification)
                    ])),
              ),
              const SizedBox(height: 30,),
              ElevatedButton.icon(
                style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.green) ),
                  onPressed: () {},
                  icon:const Icon(Icons.phone,size: 22,),
                  label:const Text('Contact ',style: TextStyle(fontSize: 22),))
            ],
          ),
        ],
      ),
    );
  }
}
