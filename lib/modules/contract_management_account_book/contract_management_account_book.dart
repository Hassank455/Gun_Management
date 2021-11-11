import 'package:flutter/material.dart';
import 'package:gun_management/modules/contract_management_account_book/show_contarct_mangement.dart';

class ContractManagementAccountBook extends StatelessWidget {
  const ContractManagementAccountBook({Key? key}) : super(key: key);

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
      body: Center(
        child: RaisedButton(
          child: Text('data'),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => ShowContractManagement()));
          },
        ),
      ),
    );
  }
}
