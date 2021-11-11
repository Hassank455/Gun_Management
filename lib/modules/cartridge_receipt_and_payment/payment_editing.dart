import 'package:flutter/material.dart';
import 'package:gun_management/shared/style/color.dart';

class PaymentEditing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text('実包受払編集', style: TextStyle(color: Colors.black)),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios, color: Colors.black)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),
            Container(
              color: primaryColor,
              height: 300,
              child: Column(
                children: [
                  SizedBox(height: 20),
                  widget6('日付','2021/10/28'),
                  Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: Divider(color: Colors.black12,thickness: 2,height: 30,),
                  ),
                  widget6('時刻','10：09'),
                  Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: Divider(color: Colors.black12,thickness: 2,height: 30,),
                  ),
                  widget6('所','愛知県保管書'),
                  Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: Divider(color: Colors.black12,thickness: 2,height: 30,),
                  ),
                  widget6('所在地','愛知県名古屋市天白区'),
                  Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: Divider(color: Colors.black12,thickness: 2,height: 30,),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget widget6(String text1,String text2){
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20),
      child: Row(
       children: [
         Text(text1,style: TextStyle(color: Colors.white),),
         SizedBox(width: 40),
         Text(text2,style: TextStyle(color: Colors.white),),

       ],
      ),
    );
  }

}
