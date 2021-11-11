import 'package:flutter/material.dart';

class ShowContractManagement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text('実包管理帳簿', style: TextStyle(color: Colors.black)),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios, color: Colors.black)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 40),
              child: Row(
                children: [
                  Text('期間：'),
                  SizedBox(width: 5),
                  Text('平成30年10月1日～令和３年10月26日'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Divider(
                color: Colors.grey[400],
                thickness: 2,
                height: 50,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 30,
                right: 30,
              ),
              child: Row(
                children: [
                  Text('住所：'),
                  SizedBox(width: 5),
                  Text('○○○○'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 15),
              child: Row(
                children: [
                  Text('氏名：'),
                  SizedBox(width: 5),
                  Text('○○○ ○○○○'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 15),
              child: Row(
                children: [
                  Text('電話番号：'),
                  SizedBox(width: 5),
                  Text('○○○ ○○○○'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Divider(
                color: Colors.grey[400],
                thickness: 2,
                height: 50,
              ),
            ),
            widget1(),
          ],
        ),
      ),
    );
  }

  Widget widget1() {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
        height: 480,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('銃'),
            Padding(
              padding: const EdgeInsets.only(right: 15, left: 15),
              child: Divider(
                color: Colors.grey[400],
                thickness: 2,
                height: 50,
              ),
            ),
            widget2(),
            widget2(),
            widget2(),
          ],
        ),
      ),
    );
  }

  Widget widget2() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 15, left: 15),
          child: Row(
            children: [
              Text('許可番号：'),
              Text('○○○○'),
            ],
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(right: 15, left: 15),
          child: Row(
            children: [
              Text('銃番号：'),
              Text('○○○○'),
            ],
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(right: 15, left: 15),
          child: Row(
            children: [
              Text('商品名等：'),
              Text('○○○○'),
            ],
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(right: 15, left: 15),
          child: Divider(
            color: Colors.grey[400],
            thickness: 2,
            height: 30,
          ),
        ),
      ],
    );
  }

}
