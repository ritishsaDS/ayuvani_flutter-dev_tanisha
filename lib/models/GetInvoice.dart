class GetInvoiceModel {
  String errors;
  int status;
  List<GetInvoiceModelDetail> data;
  String url;
  String is_feedback;
  GetInvoiceModel({
    this.errors,
    this.data,
    this.status,
  });

  GetInvoiceModel.fromJson(Map<String, dynamic> json) {
    errors = json['errors'];
    status = json['status'];
    url = json['url'];
    is_feedback = json['is_feedback'];
    if (json['data'] != null) {
      data = new List<GetInvoiceModelDetail>();
      (json['data'] as List).forEach((v) {
        data.add(new GetInvoiceModelDetail.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['errors'] = this.errors;
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

/*{
"_id": "5f80654af96bdd0b7c5f82c2",
"user_id": "5f73488ff96bdd3e2756ac72",
"invoice_no": "102",
"date": "2020-10-09 00:00:00",
"due_date": "10/13/2020 00:00:00",
"company_name": "Hshshs",
"email": "gorav@yopmail.com",
"address": "Chandigarh, India",
"subtotal": "313",
"total": "313",
"paid": "313.00",
"balance_amount": "0.00",
"comment": "chchh",
"products": [
{
"quantity": "3",
"product_id": "5f734963f96bdd3e29552c94",
"title": "Apple",
"product_description": null,
"price": "101"
},
{
"product_id": "5f806532f96bdd0b7b257002",
"quantity": "1",
"title": "Nfjdjd",
"product_description": null,
"price": "10"
}
],
"status": "0",
"showLogo": 0,
"pdf": "https://www.smarttruckerapp.com/resources/assets/invoice_pdf/1602250130.pdf",
"updated_at": "2020-10-09 18:58:50",
"created_at": "2020-10-09 18:57:38"
}*/

class GetInvoiceModelDetail {
  String id;
  String user_id;
  String invoice_no;
  String date;
  String due_date;
  String company_name;
  String email;
  String address;
  String subtotal;
  String total;
  String paid;
  String balance_amount;
  String comment;
  String status;
  int showLogo;
  String pdf;
  List<ProductDetail> products;

  GetInvoiceModelDetail({this.id, this.user_id});

  GetInvoiceModelDetail.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    user_id = json['user_id'];
    invoice_no = json['invoice_no'];
    date = json['date'];
    due_date = json['due_date'];
    company_name = json['company_name'];
    email = json['email'];
    address = json['address'];
    subtotal = json['subtotal'].toString();
    total = json['total'].toString();
    paid = json['paid'].toString();
    balance_amount = json['balance_amount'].toString();
    comment = json['comment'];
    status = json['status'].toString();
    showLogo = json['showLogo'];
    pdf = json['pdf'];
    if (json['products'] != null) {
      products = new List<ProductDetail>();
      (json['products'] as List).forEach((v) {
        products.add(new ProductDetail.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['_id'] = this.id;
    data['user_id'] = this.user_id;
    data['invoice_no'] = this.invoice_no;
    data['date'] = this.date;
    data['due_date'] = this.due_date;
    data['company_name'] = this.company_name;
    data['email'] = this.email;
    data['address'] = this.address;
    data['subtotal'] = this.subtotal;
    data['total'] = this.total;
    data['paid'] = this.paid;
    data['balance_amount'] = this.balance_amount;
    data['ccommentontent'] = this.comment;
    data['status'] = this.status;
    data['showLogo'] = this.showLogo;
    data['pdf'] = this.pdf;
    if (this.products != null) {
      data['products'] = this.products.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductDetail {
  String quantity;
  String product_id;
  String title;
  String product_description;
  String price;

  ProductDetail({this.quantity, this.product_id});

  ProductDetail.fromJson(Map<String, dynamic> json) {
    quantity = json['quantity'].toString();
    product_id = json['product_id'];
    title = json['title'];
    product_description = json['product_description'];
    price = json['price'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['quantity'] = this.quantity;
    data['product_id'] = this.product_id;
    data['title'] = this.title;
    data['product_description'] = this.product_description;
    data['price'] = this.price;
    return data;
  }
}
