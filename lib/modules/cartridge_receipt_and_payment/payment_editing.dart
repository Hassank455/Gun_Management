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
        child: DefaultTabController(
          length: 4,
          child: Column(
            children: [
              SizedBox(height: 30),
              Container(
                color: primaryColor,
                height: 230,
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    widget6('日付', '2021/10/28'),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Divider(
                        color: Colors.black12,
                        thickness: 2,
                        height: 30,
                      ),
                    ),
                    widget6('時刻', '10：09'),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Divider(
                        color: Colors.black12,
                        thickness: 2,
                        height: 30,
                      ),
                    ),
                    widget6('所', '愛知県保管書'),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Divider(
                        color: Colors.black12,
                        thickness: 2,
                        height: 30,
                      ),
                    ),
                    widget6('所在地', '愛知県名古屋市天白区'),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Divider(
                        color: Colors.black12,
                        thickness: 2,
                        height: 30,
                      ),
                    ),
                  ],
                ),
              ),
              Material(
                color: primaryColor,
                child: TabBar(
                    labelColor: Colors.white,
                    indicatorColor: Colors.white,
                    tabs: [
                      Tab(
                        text: '消費',
                      ),
                      Tab(
                        text: '譲受',
                      ),
                      Tab(
                        text: 'その他(受)',
                      ),
                      Tab(
                        text: 'その他(払)',
                      ),
                    ]),
              ),
              Container(
                height: 500,
                child: TabBarView(
                  children: [
                    widget7(),
                    widget7(),
                    widget7(),
                    widget7(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget widget6(String text1, String text2) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        children: [
          Text(
            text1,
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(width: 40),
          Text(
            text2,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget widget7() {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 50, right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('銃'),
              SizedBox(width: 70),
              Text('レベッタ'),
            ],
          ),
          Divider(color: Colors.grey[400], thickness: 2, height: 30),
          SizedBox(height: 20),
          Row(
            children: [
              Text('実包'),
              SizedBox(width: 70),
              Text('20薬莢'),
            ],
          ),
          Divider(color: Colors.grey[400], thickness: 2, height: 30),
          SizedBox(height: 20),
          Row(
            children: [
              Text('譲受別'),
              SizedBox(width: 70),
              Container(
                width: 210,
                height: 22,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(color: Colors.grey)),
                child: Padding(
                  padding: const EdgeInsets.only(right: 5, left: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('許可'),
                      Container(
                        width: 60,
                          color: Colors.blue,
                          child: Center(
                            child: Text(
                              '無許可',
                              style: TextStyle(color: Colors.white),
                            ),
                          )),
                      Text('有害駆除'),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Divider(color: Colors.grey[400], thickness: 2, height: 30),
          SizedBox(height: 20),
          Row(
            children: [
              Text('数量'),
              SizedBox(width: 70),
              Text('5'),
            ],
          ),
          Divider(color: Colors.grey[400], thickness: 2, height: 30),
          SizedBox(height: 20),
          Row(
            children: [
              Text('備考'),
              SizedBox(width: 70),
              Container(
                  width: 210,
                  child: Text(
                    '米国 個人消費支出（ＰＣＥコア・デフレーター, 四半期雇用コスト指数）',
                  )),
            ],
          ),
          Divider(color: Colors.grey[400], thickness: 2, height: 30),
        ],
      ),
    );
  }
}
