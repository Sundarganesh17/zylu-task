import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:employeetask/employee_card.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: {
      //  EmployeeDetailScreen.routeName:(context) => EmployeeDetailScreen();
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:const Color.fromARGB(255, 21, 87, 141),
        centerTitle: true,
        toolbarHeight: 40,
        title: const Text(
          'Employee List',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics:const ScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 9, right: 9),
              child: ClipRRect(
                borderRadius:const BorderRadius.all(Radius.circular(5)),
                child: Container(
                  //  margin:EdgeInsets.all(7) ,
                  color: Colors.white,
                  padding:const EdgeInsets.all(5),
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        color: Colors.black,
                        child:const Icon(
                          Icons.star,
                          size: 14,
                          color: Color.fromARGB(255, 255, 230, 8),
                        ),
                      ),
                     const SizedBox(
                        width: 16,
                      ),
                    const  Text(
                        '- Employee still workimg in same company',
                        style: TextStyle(
                            fontSize: 14,
                            color:Color.fromARGB(255, 17, 63, 101)),
                      )
                    ],
                  ),
                ),
              ),
            ),
            StreamBuilder(
                stream:
                    FirebaseFirestore.instance.collection("users").snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      physics:const NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data!.docs.length,
                      shrinkWrap: true,
                      itemBuilder: (context, i) {
                        final data = snapshot.data!.docs[i];
                        final id =
                            FirebaseFirestore.instance.collection('users').id;

                        return Container(
                          margin: const EdgeInsets.only(
                              top: 20, bottom: 10, left: 15, right: 15),
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 227, 249, 186),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    spreadRadius: 3,
                                    blurRadius: 7,
                                    offset: Offset(
                                      0,
                                      3,
                                    ))
                              ]),
                          child:
                              Stack(alignment: Alignment.topRight, children: [
                            data['current company'] && data['exp']>5
                                ? ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(15)),
                                    child: Container(
                                      height: 30,
                                      width: 30,
                                      color: Colors.black,
                                      child: const Icon(
                                        Icons.star,
                                        color: Color.fromARGB(255, 255, 230, 8),
                                      ),
                                    ),
                                  )
                                :const Text(''),
                            Padding(
                              padding: const EdgeInsets.only(top: 8, bottom: 8),
                              child: EmployeeCard(
                                data['name'],
                                data['company name'],
                                data['position'],
                                data['experience'],
                                data['qualification'],
                                data['imgurl'],
                                id,
                              ),
                            ),
                          ]),
                        );
                      },
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.red,
                      ),
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }
}
