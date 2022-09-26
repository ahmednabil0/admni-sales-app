import 'package:admin_new_app/model/invoices/invoice_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class InvoicesDate {
  CollectionReference emRef = FirebaseFirestore.instance.collection('invoices');
  List<InvoiceModel> customerList = [];
  List<InvoiceModel> customerInvoiceList = [];
  Future<List<InvoiceModel>> getInvoicesData() async {
    await emRef
        // .where('companyName', isEqualTo: sharedpref!.getString('company'))
        // .where('companyId', isEqualTo: sharedpref!.getInt('id'))

        .get()
        .then((value) {
      for (var i in value.docs) {
        customerList.add(InvoiceModel.fromMap(i));
      }
    });
    return customerList;
  }

  Future<List<InvoiceModel>> getInvoicesDataSearch(String query) async {
    await emRef
        // .where('companyName', isEqualTo: sharedpref!.getString('company'))
        // .where('companyId', isEqualTo: sharedpref!.getInt('id'))
        .where('date', isEqualTo: query)
        .get()
        .then((value) {
      for (var i in value.docs) {
        customerList.add(InvoiceModel.fromMap(i));
      }
    });
    return customerList;
  }
}
