import 'package:employeetask/employee_details.dart';
import 'package:flutter/material.dart';

class EmployeeCard extends StatefulWidget {
  @override
  State<EmployeeCard> createState() => _EmployeeCardState();
  String name;
  String companyname;
  String position;
  String experience;
  String qualification;
  String imgUrl;
  String id;
  EmployeeCard(this.name, this.companyname, this.position, this.experience,
      this.qualification, this.imgUrl, this.id);
}

class _EmployeeCardState extends State<EmployeeCard> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => EmployeeDetailScreen(
              widget.id, widget.imgUrl, widget.name,
                widget.companyname, widget.position,widget.experience,widget.qualification,
              ),
        ));
      },
      title: Center(
          child: Text(
        widget.name,
        style:const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      )),
      leading: CircleAvatar(
        radius: 40,
        backgroundImage: NetworkImage(widget.imgUrl),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(
          top: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(TextSpan(
                style:const TextStyle(fontSize: 16, color: Colors.black87),
                children: [
                 const TextSpan(text: 'Company          :   '),
                  TextSpan(text: widget.companyname)
                ])),
            Text.rich(TextSpan(
                style:const TextStyle(fontSize: 16, color: Colors.black87),
                children: [
                 const TextSpan(text: 'Position            :   '),
                  TextSpan(text: widget.position)
                ])),
            Text.rich(TextSpan(
                style:const TextStyle(fontSize: 16, color: Colors.black87),
                children: [
                 const TextSpan(text: 'Experience       :   '),
                  TextSpan(text: widget.experience)
                ])),
            Text.rich(TextSpan(
                style:const TextStyle(fontSize: 16, color: Colors.black87),
                children: [
                 const TextSpan(text: 'Qualification    :   '),
                  TextSpan(text: widget.qualification)
                ])),
          ],
        ),
      ),
    );
  }
}
