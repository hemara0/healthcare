// class Product {
//   final String name;
//   final double price;

//   const Product({required this.name, required this.price});

//   static const List<Product> products = [
//     Product(name: 'Apple', price: 100),
//     Product(name: 'Organge', price: 50),
//     Product(name: 'Pear', price: 70),
//   ];
// }

import '../provider/provider.dart';

class Product {
  String drugName;
  String drugCategory;
  String drugPrice;
  List<DrugCompany> drugCompanies;
  List<DrugStore> drugStores;

  Product({
    required this.drugName,
    required this.drugCategory,
    required this.drugPrice,
    required this.drugCompanies,
    required this.drugStores,
  });

  //static List<Product> products = fetchPharmacyData() as List<Product>;

  factory Product.fromJson(Map<String, dynamic> json) {
    List<DrugCompany> drugComps = [];
    if (json['drug_companies'] != null) {
      drugComps = (json['drug_companies'] as List<dynamic>).map((drugComp) {
        return DrugCompany(
          companyId: drugComp['companyId'] as String? ?? '',
          companyName: drugComp['companyName'] as String? ?? '',
          drugStatus: drugComp['drugStatus'] as String? ?? '',
          drugPrice: drugComp['drug_price'] as String? ?? '',
        );
      }).toList();
    }

    List<DrugStore> drugStoress = [];
    if (json['drug_store'] != null) {
      drugStoress = (json['drug_store'] as List<dynamic>).map((drugStore) {
        return DrugStore(
          storeId: drugStore['storeId'] as String? ?? '',
          storeName: drugStore['storeName'] as String? ?? '',
          drugStock: drugStore['drugStock'] as String? ?? '',
          drugPrice: drugStore['drug_price'] as String? ?? '',
        );
      }).toList();
    }

    return Product(
      drugName: json['drug_name'],
      drugCategory: json['drug_category'],
      drugPrice: json['drug_price'],
      drugCompanies: drugComps,
      drugStores: drugStoress,
    );
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>>? drugCompaniesJson =
        drugCompanies.map((drugCompany) => drugCompany.toJson()).toList();
    List<Map<String, dynamic>>? drugStoresJson =
        drugStores.map((drugStore) => drugStore.toJson()).toList();

    return {
      'drug_name': drugName,
      'drug_category': drugCategory,
      'drug_price': drugPrice,
      'drug_companies': drugCompaniesJson,
      'drug_store': drugStoresJson,
    };
  }
}

class DrugCompany {
  final String companyId;
  final String companyName;
  final String drugStatus;
  final String drugPrice;

  DrugCompany({
    required this.companyId,
    required this.companyName,
    required this.drugStatus,
    required this.drugPrice,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'companyId': companyId,
      'companyName': companyName,
      'drugStatus': drugStatus,
      'drugPrice': drugPrice,
    };

    return data;
  }
}

class DrugStore {
  final String storeId;
  final String storeName;
  final String drugStock;
  final String drugPrice;

  DrugStore({
    required this.storeId,
    required this.storeName,
    required this.drugStock,
    required this.drugPrice,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'storeId': storeId,
      'storeName': storeName,
      'drugStock': drugStock,
      'drugPrice': drugPrice,
    };

    return data;
  }
}
