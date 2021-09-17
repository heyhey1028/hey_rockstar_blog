import 'package:flutter/material.dart';

class CategoryBar extends StatelessWidget {
  const CategoryBar({
    Key key,
    @required this.onTap,
  }) : super(key: key);

  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FittedBox(
        child: Row(
          children: [
            TextButton(
                onPressed: () => onTap(0),
                child: Text(
                  'HOME',
                  style: TextStyle(color: Colors.white),
                )),
            SizedBox(width: 32),
            TextButton(
                onPressed: () => onTap(1),
                child: Text('TECH', style: TextStyle(color: Colors.white))),
            SizedBox(width: 32),
            TextButton(
                onPressed: () => onTap(2),
                child:
                    Text('LIFE STYLE', style: TextStyle(color: Colors.white))),
            SizedBox(width: 32),
            TextButton(
                onPressed: () => onTap(2),
                child:
                    Text('ENGINEERING', style: TextStyle(color: Colors.white))),
            SizedBox(width: 32),
            TextButton(
                onPressed: () => onTap(1),
                child: Text('THOUGHTS', style: TextStyle(color: Colors.white))),
          ],
        ),
      ),
    );
  }
}
