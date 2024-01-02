import 'package:cloud_firestore/cloud_firestore.dart';

List<String> imagesForFirstListOfCategories = [
  'assets/images/slider3.png',
  'assets/images/slider1.png',
];

List<String> imagesForSecondListOfCategories = [
  'assets/images/slider5.png',
  'assets/images/slider4.png',
];

List<String> imagesForBestSeller = [
  'assets/images/test1.png',
  'assets/images/test2.png',
  'assets/images/test3.png',
  'assets/images/test4.png',
];

List<String> imageForFireBase = [
  'https://github.com/RihamAhmed16/Mo-Taxi/blob/master/assets/assets_firebase/seyami/Seyami%20Lux%20Gateau.png?raw=true',
  'https://github.com/RihamAhmed16/Mo-Taxi/blob/master/assets/assets_firebase/seyami/Swiss%20Black%20Forest%20Gateau.png?raw=true',
  'https://github.com/RihamAhmed16/Mo-Taxi/blob/master/assets/assets_firebase/seyami/Vanilla%20Gateau.png?raw=true',
  'https://github.com/RihamAhmed16/Mo-Taxi/blob/master/assets/assets_firebase/seyami/Zalabia%20-%20Kilo.png?raw=true',
  'https://github.com/RihamAhmed16/Mo-Taxi/blob/master/assets/assets_firebase/seyami/seyami1.png?raw=true',
];

List<Map<String, dynamic>> products = [
  {
    'image':
        'https://github.com/RihamAhmed16/Mo-Taxi/blob/master/assets/assets_firebase/seyami/Balah%20El%20Sham%20-%20Kilo.png?raw=true',
    'name': 'Balah El Sham 1/2 kilo Dis',
    'code': '1380001',
    'price': '36',
    'number_in_cart': 0,
    'rating': 3.0,
    'created_at': FieldValue.serverTimestamp(),
    'descriptions': 'Balah al-sham with delicious honey',
    'category': 'Seyami',
    'Size': '1/2 Kilo',
    'category_id': 8,
    'isBestSeller': false,
    'isDiscount': true,
    'discount': 40,
    'oldPrice': 60,
  },
  {
    'image':
        'https://github.com/RihamAhmed16/Mo-Taxi/blob/master/assets/assets_firebase/seyami/Black%20Forest%20Gateau.jpg?raw=true',
    'name': 'Black Forest Gateau Dis',
    'code': '1380083',
    'price': '14.40',
    'number_in_cart': 0,
    'rating': 3.0,
    'created_at': FieldValue.serverTimestamp(),
    'descriptions':
        'Chocolate cake rich in delicious vanilla cream sweetened with honey syrup covered with grated milk chocolate and cherry (The product may differ from the image daily)',
    'category': 'Seyami',
    'Size': 'Piece',
    'category_id': 8,
    'isBestSeller': false,
    'isDiscount': true,
    'discount': 40,
    'oldPrice': 24,
  },
  {
    'image':
        'https://github.com/RihamAhmed16/Mo-Taxi/blob/master/assets/assets_firebase/seyami/Chocolate%20Swiss%20Roll.png?raw=true',
    'name': 'Chocolate Swiss Roll',
    'code': '1150007',
    'price': '180',
    'number_in_cart': 0,
    'rating': 3.0,
    'created_at': FieldValue.serverTimestamp(),
    'descriptions': 'It consists of (fresh cream filling with strawberry pieces, and the final form is milk chocolate with fresh strawberry pieces) (The product may differ from the image daily)',
    'category': 'Seyami',
    'Size': 'Piece',
    'category_id': 8,
    'isBestSeller': true,
    'isDiscount': false,
    'discount': 0.0,
    'oldPrice': 0.0,
  },
  {
    'image':
    'https://github.com/RihamAhmed16/Mo-Taxi/blob/master/assets/assets_firebase/seyami/Dueto%20Fruits%20&%20Mix%20Dark%20-Torte%2024%20CM.png?raw=true',
    'name': 'Dueto Fruits & Mix Dark Torte - 24 Cm-Dis',
    'code': '1380166',
    'price': '276',
    'number_in_cart': 0,
    'rating': 3.0,
    'created_at': FieldValue.serverTimestamp(),
    'descriptions': 'Dueto Fruits & Mix Dark Torte - 24 Cm-Dis',
    'category': 'Seyami',
    'Size': 'Piece',
    'category_id': 8,
    'isBestSeller': true,
    'isDiscount': true,
    'discount': 40,
    'oldPrice': 460,
  },
  {
    'image':
        'https://github.com/RihamAhmed16/Mo-Taxi/blob/master/assets/assets_firebase/seyami/Heart%20mix%20Nutella%20Torte.png?raw=true',
    'name': 'Heart mix Nutella Torte',
    'code': '1480006',
    'price': '390',
    'number_in_cart': 0,
    'rating': 3.0,
    'created_at': FieldValue.serverTimestamp(),
    'descriptions':
        'Consta de (tarta de chocolate + crema de chocolate + relleno sudanés + 12 pistachos + 4 cerezas + 6 cuadritos de chocolate + logo Etoile)(The product may differ from the image daily)',
    'category': 'Seyami',
    'Size': 'Torte',
    'category_id': 8,
    'isBestSeller': true,
    'isDiscount': false,
    'discount': 0.0,
    'oldPrice': 0.0,
  },
  {
    'image':
    'https://github.com/RihamAhmed16/Mo-Taxi/blob/master/assets/assets_firebase/seyami/Kahk%20With%20Walnuts%20Box%20-%20Kilo.png?raw=true',
    'name': 'Kahk With Walnuts Box -1/2 Kilo',
    'code': '170058',
    'price': '140',
    'number_in_cart': 0,
    'rating': 4.0,
    'created_at': FieldValue.serverTimestamp(),
    'descriptions':
    'Plain cakes consist of (flour - natural ghee - natural milk water - powdered sugar - mahlab - cake smell - baking powder - malban - walnut eye)',
    'category': 'Seyami',
    'Size': 'Packet',
    'category_id': 8,
    'isBestSeller': true,
    'isDiscount': false,
    'discount': 0.0,
    'oldPrice': 0.0,
  },
  {
    'image':
    'https://github.com/RihamAhmed16/Mo-Taxi/blob/master/assets/assets_firebase/seyami/Kunafa%20Asawer%20with%20Nutella%20-%20Kilo.png?raw=true',
    'name': 'Kunafa Asawer with Nutella - Kilo',
    'code': '80019',
    'price': '280',
    'number_in_cart': 0,
    'rating': 3.0,
    'created_at': FieldValue.serverTimestamp(),
    'descriptions':
    'It is a konafa wrapped in the form of small bracelets, stuffed with Nutella',
    'category': 'Seyami',
    'Size': 'Kilo',
    'category_id': 8,
    'isBestSeller': true,
    'isDiscount': false,
    'discount': 0.0,
    'oldPrice': 0.0,
  },
  {
    'image':
    'https://github.com/RihamAhmed16/Mo-Taxi/blob/master/assets/assets_firebase/seyami/Large%20Mix%20Lux%20Box%20-%2050%20Pcs.png?raw=true',
    'name': 'Large Mix Lux Box - 50 Pcs',
    'code': '960007',
    'price': '245',
    'number_in_cart': 0,
    'rating': 2.0,
    'created_at': FieldValue.serverTimestamp(),
    'descriptions':
    '16 pieces of plain basbousa - 3 pieces of plain konafa - 6 pieces of kunafa with cream- 4 pieces of golash with cream - 2 swabe\' zainab - 2 Balah el sham - 2 Zalabya - 8 plain remosh - 4 plain golash - 3 baklava with hazelnuts - 4 kunafa with nuts - 2 Burma with Hazelnut--The number of pieces is approximate',
    'category': 'Seyami',
    'Size': 'Package',
    'category_id': 8,
    'isBestSeller': true,
    'isDiscount': false,
    'discount': 0.0,
    'oldPrice': 0.0,
  },
  {
    'image':
    'https://github.com/RihamAhmed16/Mo-Taxi/blob/master/assets/assets_firebase/seyami/Nashader%20Biscuits%20Packet%20-%2015%20Pcs.png?raw=true',
    'name': 'Seyami Nashader Biscuit-Syami-1/2 Kilo',
    'code': '870007',
    'price': '70',
    'number_in_cart': 0,
    'rating': 4.0,
    'created_at': FieldValue.serverTimestamp(),
    'descriptions':
    'Seyami Nashader Biscuit-Syami-1/2 Kilo',
    'category': 'Seyami',
    'Size': '1/2 Kilo',
    'category_id': 8,
    'isBestSeller': true,
    'isDiscount': false,
    'discount': 0.0,
    'oldPrice': 0.0,
  },
  {
    'image':
    'https://github.com/RihamAhmed16/Mo-Taxi/blob/master/assets/assets_firebase/seyami/Ores%20Agwa%20-%20Kilo.png?raw=true',
    'name': 'Ores Agwa -1/2 Kilo',
    'code': '170006',
    'price': '60',
    'number_in_cart': 0,
    'rating':3.0,
    'created_at': FieldValue.serverTimestamp(),
    'descriptions':
    'A small disk of Ajwa (Ajna) consists of butter, flour and fresh cream',
    'category': 'Seyami',
    'Size': '1/2 Kilo',
    'category_id': 8,
    'isBestSeller': false,
    'isDiscount': false,
    'discount': 0.0,
    'oldPrice': 0.0,
  },
  {
    'image':
    'https://github.com/RihamAhmed16/Mo-Taxi/blob/master/assets/assets_firebase/seyami/Permoda%20Lotus%20Gateau.png?raw=true',
    'name': 'Permoda Lotus Gateau',
    'code': '850007',
    'price': '50',
    'number_in_cart': 0,
    'rating':2.0,
    'created_at': FieldValue.serverTimestamp(),
    'descriptions':
    'Kiri cheese cream, sponge cake, lotus biscuit, lotus spread with lotus biscuit pieces(The product may differ from the image daily)',
    'category': 'Seyami',
    'Size': 'Piece',
    'category_id': 8,
    'isBestSeller': false,
    'isDiscount': false,
    'discount': 0.0,
    'oldPrice': 0.0,
  },
  {
    'image':
    'https://github.com/RihamAhmed16/Mo-Taxi/blob/master/assets/assets_firebase/seyami/Petit%20Four%20Packet%20-%2012%20Pcs.png?raw=true',
    'name': 'Petit Four Packet - 12 Pcs',
    'code': '170131',
    'price': '45',
    'number_in_cart': 0,
    'rating':3.0,
    'created_at': FieldValue.serverTimestamp(),
    'descriptions':
    'It consists of (flour - natural butter - pasteurized eggs - powdered sugar - vanilla - cocoa - chocolate - jam - nuts - crushed hazelnuts - crushed pistachios)',
    'category': 'Seyami',
    'Size': 'Packet',
    'category_id': 8,
    'isBestSeller': false,
    'isDiscount': false,
    'discount': 0.0,
    'oldPrice': 0.0,
  },
  {
    'image':
    'https://github.com/RihamAhmed16/Mo-Taxi/blob/master/assets/assets_firebase/seyami/Sable%20and%20Tart%20Packet%20-%2012%20Pcs.png?raw=true',
    'name': 'Sable and Tart Packet - 12 Pcs',
    'code': '170132',
    'price': '80',
    'number_in_cart': 0,
    'rating':2.0,
    'created_at': FieldValue.serverTimestamp(),
    'descriptions':
    'It consists of (flour - natural butter - powdered sugar - pasteurized eggs - white ganache - chocolate ganache - nuts - jam - sesame)',
    'category': 'Seyami',
    'Size': 'Plate',
    'category_id': 8,
    'isBestSeller': false,
    'isDiscount': false,
    'discount': 0.0,
    'oldPrice': 0.0,
  },
  {
    'image':
    'https://github.com/RihamAhmed16/Mo-Taxi/blob/master/assets/assets_firebase/seyami/Sawabe\'%20Zainab%20-%20Kilo.png?raw=true',
    'name': 'Sawabe\' Zainab - Kilo',
    'code': '40004',
    'price': '110',
    'number_in_cart': 0,
    'rating':2.0,
    'created_at': FieldValue.serverTimestamp(),
    'descriptions':
    'fried fingers with delicious honey',
    'category': 'Seyami',
    'Size': 'Kilo',
    'category_id': 8,
    'isBestSeller': false,
    'isDiscount': false,
    'discount': 0.0,
    'oldPrice': 0.0,
  },
  {
    'image':
    'https://github.com/RihamAhmed16/Mo-Taxi/blob/master/assets/assets_firebase/seyami/Seyami%20Fruits%20Gateau.png?raw=true',
    'name': 'Seyami Fruits Gateau',
    'code': '890008',
    'price': '21',
    'number_in_cart': 0,
    'rating':5.0,
    'created_at': FieldValue.serverTimestamp(),
    'descriptions':
    'Consists of (sponge cake without eggs - vegan cream - vegan butter - crunchy filling and nuts - fruits)',
    'category': 'Seyami',
    'Size': 'Piece',
    'category_id': 8,
    'isBestSeller': true,
    'isDiscount': false,
    'discount': 0.0,
    'oldPrice': 0.0,
  },
  {
    'image':
    'https://github.com/RihamAhmed16/Mo-Taxi/blob/master/assets/assets_firebase/seyami/Seyami%20Lux%20Gateau,.png?raw=true',
    'name': 'Seyami Lux Gateau',
    'code': '890008',
    'price': '21',
    'number_in_cart': 0,
    'rating':5.0,
    'created_at': FieldValue.serverTimestamp(),
    'descriptions':
    'Seyami Lux Gateau With Cream',
    'category': 'Seyami',
    'Size': 'Piece',
    'category_id': 8,
    'isBestSeller': true,
    'isDiscount': false,
    'discount': 0.0,
    'oldPrice': 0.0,
  },
  {
    'image':
    'https://github.com/RihamAhmed16/Mo-Taxi/blob/master/assets/assets_firebase/seyami/Seyami%20Lux%20Gateau.png?raw=true',
    'name': 'Seyami Lux Gateau',
    'code': '890008',
    'price': '21',
    'number_in_cart': 0,
    'rating':0.0,
    'created_at': FieldValue.serverTimestamp(),
    'descriptions':
    'Seyami Lux Gateau With Chocolate',
    'category': 'Seyami',
    'Size': 'Piece',
    'category_id': 8,
    'isBestSeller': false,
    'isDiscount': false,
    'discount': 0.0,
    'oldPrice': 0.0,
  },
  {
    'image':
    'https://github.com/RihamAhmed16/Mo-Taxi/blob/master/assets/assets_firebase/seyami/Swiss%20Black%20Forest%20Gateau.png?raw=true',
    'name': 'Swiss Black Forest Gateau',
    'code': '1380111',
    'price': '18',
    'number_in_cart': 0,
    'rating':3.0,
    'created_at': FieldValue.serverTimestamp(),
    'descriptions':
    'Fudge sponge cake stuffed with vanilla cream, cherry jam and milk chocolate shredded with honey (The product may differ from the image daily)',
    'category': 'Seyami',
    'Size': 'Piece',
    'category_id': 8,
    'isBestSeller': false,
    'isDiscount': true,
    'discount': 40,
    'oldPrice': 30,
  },
  {
    'image':
    'https://github.com/RihamAhmed16/Mo-Taxi/blob/master/assets/assets_firebase/seyami/Vanilla%20Gateau.png?raw=true',
    'name': 'Seyami Vanilla Gateau',
    'code': '1380089',
    'price': '14.40',
    'number_in_cart': 0,
    'rating':3.0,
    'created_at': FieldValue.serverTimestamp(),
    'descriptions':
    'Vanilla cake riched with delicious cinnamon cream with honey syrup and white chocolate glaze covered with cherries, almonds or hazelnuts (The product may differ from the image daily)',
    'category': 'Seyami',
    'Size': 'Piece',
    'category_id': 8,
    'isBestSeller': false,
    'isDiscount': true,
    'discount': 40,
    'oldPrice': 24,
  },
  {
    'image':
    'https://github.com/RihamAhmed16/Mo-Taxi/blob/master/assets/assets_firebase/seyami/Zalabia%20-%20Kilo.png?raw=true',
    'name': 'Zalabia - Kilo',
    'code': '1380004',
    'price': '60',
    'number_in_cart': 0,
    'rating':3.0,
    'created_at': FieldValue.serverTimestamp(),
    'descriptions':
    '"It is a dough for lokma al-qady with delicious honey "',
    'category': 'Seyami',
    'Size': 'Piece',
    'category_id': 8,
    'isBestSeller': false,
    'isDiscount': true,
    'discount': 40,
    'oldPrice': 100,
  },
  {
    'image':
    'https://github.com/RihamAhmed16/Mo-Taxi/blob/master/assets/assets_firebase/seyami/seyami1.png?raw=true',
    'name': 'Seyami Plain Menen-1/2 Kilo',
    'code': '900007',
    'price': '80',
    'number_in_cart': 0,
    'rating':0.0,
    'created_at': FieldValue.serverTimestamp(),
    'descriptions':
    'Seyami Plain Menen-1/2 Kilo',
    'category': 'Seyami',
    'Size': 'Packet',
    'category_id': 8,
    'isBestSeller': false,
    'isDiscount': false,
    'discount': 0,
    'oldPrice': 0,
  },
];

Future<void> updateProductCategoryIds() async {
  try {
    //Fetch all categories
    // QuerySnapshot categorySnapshot =
    //     await FirebaseFirestore.instance.collection('categories').get();
    //
    // // Loop through each category
    // for (QueryDocumentSnapshot categoryDoc in categorySnapshot.docs) {
    //   String categoryId = categoryDoc['id'];
    //
    //   // Fetch products for the current category
    //   QuerySnapshot productSnapshot = await FirebaseFirestore.instance
    //       .collection('products')
    //       .where('categories',
    //           isEqualTo: categoryDoc[
    //               'name']) // Replace with the actual field name for category name
    //       .get();
    // QuerySnapshot productSnapshot =
    //     await FirebaseFirestore.instance.collection('products').get();
    // CollectionReference productCollection =
    //     FirebaseFirestore.instance.collection('products');
    // // Update each product with the category ID
    // for (QueryDocumentSnapshot product in productSnapshot.docs) {
    //   String productId = product.id;
    //   await FirebaseFirestore.instance
    //       .collection('products')
    //       .doc(productId)
    //       .update({
    //     'product_id': productId
    //   }); // Replace with the actual field name for category ID
    // }
    // for (int i = 0; i < products.length; i++) {
    //   String productId = const Uuid().v4();
    //   await FirebaseFirestore.instance
    //       .collection('products')
    //       .doc(productId)
    //       .set(products[
    //           i]); // Replace with the actual field name for category ID
    // }

    print('Products updated successfully!');
  } catch (e) {
    print('Error updating products: $e');
  }
}
