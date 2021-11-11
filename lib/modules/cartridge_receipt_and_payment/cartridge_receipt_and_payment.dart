import 'package:flutter/material.dart';
import 'package:gun_management/modules/cartridge_receipt_and_payment/payment_editing.dart';

class CartridgeReceiptAndPayment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text('実包受払', style: TextStyle(color: Colors.black)),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios, color: Colors.black)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(right: 20, left: 20),
          child: Column(
            children: [
              SizedBox(height: 30),
              Divider(
                color: Colors.grey[400],
                thickness: 2,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => PaymentEditing()));
                  },
                  child: widget5()),
              SizedBox(height: 15),
              Divider(
                color: Colors.grey[400],
                thickness: 2,
              ),
              widget5(),
              SizedBox(height: 15),
              Divider(
                color: Colors.grey[400],
                thickness: 2,
              ),
              widget5(),
              SizedBox(height: 15),
              Divider(
                color: Colors.grey[400],
                thickness: 2,
              ),
              widget5(),
              SizedBox(height: 15),
              Divider(
                color: Colors.grey[400],
                thickness: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget widget5() {
    return Padding(
      padding: EdgeInsets.only(right: 10, left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('2021/10/29'),
          SizedBox(height: 10),
          Text('無許可'),
          SizedBox(height: 10),
          Text('消費：レベッタ'),
          SizedBox(height: 10),
          Text('保管場所：札幌保管庫'),
          SizedBox(height: 10),
          Text('備考：米国 個人消費支出（ＰＣＥコア・デフレーター\,四半期雇用コスト指数）'),
        ],
      ),
    );
  }
}
