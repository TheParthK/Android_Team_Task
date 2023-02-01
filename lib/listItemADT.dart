import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListItem extends StatefulWidget {
  final int index;
  final Function deleteItem;
  const ListItem({
    required this.index,
    required this.deleteItem,
    super.key});

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Color buttonColor = Color.fromARGB(89, 255, 255, 255);
    Color getColor(){
      if((widget.index+1)%4 == 0){
        return Colors.yellow;
      } else if((widget.index+2)%4 == 0){
        return const Color.fromARGB(255, 157, 241, 233);
      } else if((widget.index+3)%4 == 0){
        return const Color.fromARGB(255, 146, 242, 178);
      } else {
        return const Color.fromARGB(255, 141, 220, 230);
      }
    }
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: getColor(),
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 70,
              height: 70,
            ),

            Expanded(child: Center(child: Text('Item ${widget.index + 1}',)),),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: PopupMenuButton(
              color: Colors.white,
              elevation: 2,
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    onTap: () {
                      widget.deleteItem(widget.index);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const[
                        Icon(CupertinoIcons.clear, size: 16, color: Colors.red,),
                        Text('Delete')
                      ],
                    ),
                  )
                ];
              },
              child: Container(
                width: 70 - 24,
                height: 70 - 24,
                decoration: BoxDecoration(
                  color: buttonColor,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(width: 1, color: Colors.white)
                ),
                child: const Center(
                  child: Icon(
                    CupertinoIcons.option,
                      size: 15,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}