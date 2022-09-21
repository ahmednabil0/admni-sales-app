import 'package:get/get.dart';

class MyLocal implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'ar': {
          "1": " انشاء الشركة",
          "2": "اسم الموظف",
          "3": "كلمة المرور",
          "4": "تغيير اللغة",
          "5": "يرجي ملئ هذا الحقل",
          "6": "اللغة العربية",
          "7": "english",
          "8": "الغاء",
          "9": "موافق",
          "10": "مرحبا ",
          "11": "اليوميات",
          "12": "الفواتير",
          "13": "التحصيلات",
          "14": "المرتجعات",
          "15": "طلب تحويل الكميات",
          "16": "استلام الكميات",
          "17": "انشاء فاتورة",
          "18": "تعديل فاتورة",
          "19": "الفواتير المعلقة",
          "20": "اسم العميل",
          "21": "اضافة صنف",
          "22": "اختيار الاصناف",
          "23": "الكمية",
          "24": "المنتج",
          "25": "السعر",
          "26": "الضريبة",
          "27": "الوحدة",
          "28": "تأكيد العملية",
          "29": "اضافة قيمة توصيل",
          "30": "القيمة",
          "31": "اضافة ضريبة اضافية",
          "32": "ملخص الفاتورة",
          "33": "الضريبة",
          "34": "الاجمالي",
          "35": "التوصيل",
          "36": "اضافة",
          "37": "انشاء الفاتورة",
          "38": "يجب اختيار الاصناف ",
          "39": "ابحث هنا باليوم",
          "40": "اختيار التوقيت",
          "41": "رقم الفاتورة",
          "42": "اسم العميل",
          "43": "تاريخ الفاتورة",
          "44": "الاجمالي",
          "45": "عرض التفاصيل",
          "46": "المبلغ المدفوع",
          "47": "المبلغ المتبقي",
          "48": "اسم الشركة",
          "49": "تاريخ الانتهاء",
          "50": "المبلغ المدفوع",
          "51": "الاصناف",
          "52": "تحصيل مدفوعات الاجل",
          "53": "ابحث بتاريخ الفاتورة",
          "54": "لا توجود فواتير",
          "55": "تأكيد ",
          "56": "اجلاّ",
          "57": "نقداّ",
          "58": "الكمية المدفوعة",
          "59": "المبلغ",
          "60": "يرجي ادخال المبلغ ",
          "61": "انشاء مرتجع",
          "62": "المرتجعات",
          "63": "إغلاق اليومية",
          "64": "اليوميات المغلقة",
          "65": "رقم السند",
          "66": "رقم الايصال",
          "67": "تاريخ السند",
          "68": "اجمالي المدفوع",
          "69": "اسم الفرع",
          "70": "من فرع :",
          "71": "الي فرع :",
          "72": "تأكيد الاستلام",
          "73": "يتم الشحن الان .....",
          "74": "تاريخ الشحن :",
          "75": "الموظفون",
          "76": "العملاء",
          "77": "رقم الهاتف",
          "78": "الصلاحية",
          "79": "الراتب",
          "80": "الوظيفة",
          "81": "مندوب مبيعات",
          "82": "مدير فرع",
          "83": "مدير عام",
          "84": "انشاء حساب",
          "85": "البريد الالكتروني",
          "86": "تحديد فرع",
          "87": "تحديد الراتب",
          "88": "تحديد الوظيفة",
          "89": "بيانات المستخدم",
          "90": "الفروع",
          "91": "الاصناف",
          "92": "",
          "93": "",
          "94": "",
          "95": "",
          "96": "",
          "97": "",
          "98": "",
          "99": "",
          "100": "",
        },
        'en': {
          "1": "create company",
          "2": "employee name ",
          "3": "password",
          "4": "change langueges",
          "5": "this feild is required",
          "6": "اللغة العربية",
          "7": "english",
          "8": "cancel",
          "9": "confirm",
          "10": "welcome ",
          "11": "Diary",
          "12": "Invoices",
          "13": "Collections",
          "14": "ٌReturns",
          "15": "Transfer of Quantities",
          "16": "Receipt of quantities",
          "17": "create invoice",
          "18": "update invoice",
          "19": "invoices to sended",
          "20": "customer name",
          "21": "add product",
          "22": "select items",
          "23": "quntity",
          "24": "item",
          "25": "price",
          "26": "vat",
          "27": "unit",
          "28": "confirm operation",
          "29": "add delveiry value ",
          "30": "value",
          "31": "add vat value",
          "32": "invoice summery",
          "33": "vat .......",
          "34": "total .....",
          "35": "delevery",
          "36": "add",
          "37": "create invoice",
          "38": "care , choose any items ",
          "39": "search here with day",
          "40": "choose time",
          "41": "invoice id",
          "42": "customer name",
          "43": "invoice date",
          "44": "total",
          "45": "details",
          "46": "Payment",
          "47": "Balance",
          "48": "company name",
          "49": "due date",
          "50": "payment",
          "51": "products",
          "52": "get rent invoices",
          "53": "search with invoice date",
          "54": "no invoices founded",
          "55": "confirm",
          "56": "rent",
          "57": "cash",
          "58": "payed amount",
          "59": "amount",
          "60": "please, enter the amount",
          "61": "create return",
          "62": "returns",
          "63": "close daily",
          "64": "closed dailyes",
          "65": "rent id",
          "66": "return id",
          "67": "rent date",
          "68": "total payed",
          "69": "bransh name",
          "70": "from bransh :",
          "71": "to bransh :",
          "72": "confirm receive",
          "73": "is delivering ....",
          "74": "delivering date :",
          "75": "ٍStaff",
          "76": "Customers",
          "77": "phone num",
          "78": "permision",
          "79": "salary",
          "80": "jop",
          "81": "sales rep",
          "82": "Branch Manager",
          "83": "Manger",
          "84": "create user",
          "85": "Email Address",
          "86": "select bransh",
          "87": "select salary",
          "88": "select jop",
          "89": "user data",
          "90": "branches",
          "91": "products",
          "92": "",
          "93": "",
          "94": "",
          "95": "",
          "96": "",
          "97": "",
          "98": "",
          "99": "",
          "100": "",
        },
      };
}
