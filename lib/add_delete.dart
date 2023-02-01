import 'package:android_c_att/listItemADT.dart';
import 'package:flutter/material.dart';

class AddDelete extends StatefulWidget {
  const AddDelete({super.key});

  @override
  State<AddDelete> createState() => _AddDeleteState();
}

class _AddDeleteState extends State<AddDelete> {
  List <ListItem> itemList = [];
  int lastI = 0;
  addItem(){
    setState(() {
      itemList.add(ListItem(index: lastI, deleteItem: deleteItem,));
    });
    lastI ++;
  }
  deleteItem(int index){
    setState(() {
      itemList.removeWhere((element) => element.index == index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(milliseconds: 1000),
        behavior: SnackBarBehavior.floating,
        dismissDirection: DismissDirection.horizontal,
        content: Container(
          height: 50,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(25)),
            boxShadow: [
              BoxShadow(color: Color.fromARGB(20, 0, 0, 0), blurRadius: 10)
            ]
          ),
          child: Center(child: Text('Item ${index+1} Deleted', style: const TextStyle(color: Colors.black),))
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        width: 200
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 247, 247, 247),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/logo.png'), fit: BoxFit.contain)
              ),
            ),
            const Text('Android Club: Android Team Task', style: TextStyle(fontSize: 18),),
          ],
        ),
        backgroundColor: ThemeData.light().primaryColorLight,
        elevation: 0,
      ),
        body: itemList.isNotEmpty?ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: itemList.length,
          itemBuilder: (context, index) {
            return itemList[index];
          },
        ):SizedBox(
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text('Click the FAB to add an Item'),
              Text('Made By: Parth Kalia'),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: ThemeData.light().primaryColorLight,
          child: const Center(
            child: Icon(
              Icons.add
            ),
          ),
          onPressed: (){
            addItem();
          },
        ),
    );
  }
}