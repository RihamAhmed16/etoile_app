import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

List<String> imagesForFirstListOfCategories = [
  'assets/images/slider5.png',
  'assets/images/cat1.png',
];

List<String> imagesForSecondListOfCategories = [
  'assets/images/slider2.png',
  'assets/images/cat1.png',
];

List<String> imagesForBestSeller = [
  'assets/images/test1.png',
  'assets/images/test2.png',
  'assets/images/test3.png',
  'assets/images/test4.png',
];

List<String> imageForFireBase = [
  'https://github.com/RihamAhmed16/Mo-Taxi/blob/master/assets/assets_firebase/oriental_sweets/oriental.png?raw=true',
  'https://github.com/RihamAhmed16/Mo-Taxi/blob/master/assets/assets_firebase/oriental_sweets/gateaux%20soiree.png?raw=true',
  'https://github.com/RihamAhmed16/Mo-Taxi/blob/master/assets/assets_firebase/oriental_sweets/Zalabia%20-%20Kilo.png?raw=true',
  'https://github.com/RihamAhmed16/Mo-Taxi/blob/master/assets/assets_firebase/oriental_sweets/Seyami%20Plain%20Basbousa%20plate.png?raw=true',
  'https://github.com/RihamAhmed16/Mo-Taxi/blob/master/assets/assets_firebase/desserts/Swiss%20Black%20Forest%20Gateau.png?raw=true',
  'https://github.com/RihamAhmed16/Mo-Taxi/blob/master/assets/assets_firebase/oriental_sweets/Large%20Mix%20Lux%20Box%20-%2050%20Pcs.png?raw=true',
  'https://github.com/RihamAhmed16/Mo-Taxi/blob/master/assets/assets_firebase/oriental_sweets/Sable%20and%20Tart%20Packet%20-%2012%20Pcs.png?raw=true',
  'https://github.com/RihamAhmed16/Mo-Taxi/blob/master/assets/assets_firebase/oriental_sweets/Rice%20Pudding%20Qonbela%20-Dis.png?raw=true',
  'https://github.com/RihamAhmed16/Mo-Taxi/blob/master/assets/assets_firebase/oriental_sweets/Plain%20Ghorayeba%20Packet%20-%2015%20Pcs.png?raw=true',
  'https://github.com/RihamAhmed16/Mo-Taxi/blob/master/assets/assets_firebase/oriental_sweets/Petit%20Four%20Packet%20-%2012%20Pcs.png?raw=true',
];

List<Map<String, dynamic>> products = [
  {
    'image':
        'https://github.com/RihamAhmed16/Mo-Taxi/blob/master/assets/assets_firebase/oriental_sweets/oriental.png?raw=true',
    'name': 'Pistachio Basbousa - Medium Plate',
    'code': '20023',
    'price': '175',
    'number_in_cart': 0,
    'rating': 3.0,
    'created_at': FieldValue.serverTimestamp(),
    'descriptions': 'Forma Basbousa with pistachio',
    'category': 'Oriental Sweets',
    'Size': 'Plate',
    'category_id': 2,
    'isBestSeller': true,
    'isDiscount': false,
    'discount': 0.0,
    'oldPrice': 0.0,
  },
  {
    'image':
        'https://github.com/RihamAhmed16/Mo-Taxi/blob/master/assets/assets_firebase/oriental_sweets/gateaux%20soiree.png?raw=true',
    'name': 'gateaux soiree',
    'code': '120001',
    'price': '150',
    'number_in_cart': 0,
    'rating': 1.0,
    'created_at': FieldValue.serverTimestamp(),
    'descriptions':
        'A medium Suiee bag (approx half a kilo) from 15 to 18 pieces (The product may differ from the image daily)',
    'category': 'Oriental Sweets',
    'Size': 'Package',
    'category_id': 2,
    'isBestSeller': true,
    'isDiscount': false,
    'discount': 0.0,
    'oldPrice': 0.0,
  },
  {
    'image':
        'https://github.com/RihamAhmed16/Mo-Taxi/blob/master/assets/assets_firebase/oriental_sweets/Zalabia%20-%20Kilo.png?raw=true',
    'name': 'Zalabia - Kilo',
    'code': '40007',
    'price': '100',
    'number_in_cart': 0,
    'rating': 2.0,
    'created_at': FieldValue.serverTimestamp(),
    'descriptions': '"It is a dough for lokma al-qady with delicious honey"',
    'category': 'Oriental Sweets',
    'Size': 'One kilo',
    'category_id': 2,
    'isBestSeller': true,
    'isDiscount': false,
    'discount': 0.0,
    'oldPrice': 0.0,
  },
  {
    'image':
        'https://github.com/RihamAhmed16/Mo-Taxi/blob/master/assets/assets_firebase/oriental_sweets/Seyami%20Plain%20Basbousa%20plate.png?raw=true',
    'name': 'Seyami Plain Basbousa plate',
    'code': '870001',
    'price': '100',
    'number_in_cart': 0,
    'rating': 4.0,
    'created_at': FieldValue.serverTimestamp(),
    'descriptions':
        'Consists of (semolina - water - vegetable cream - vegetable ghee - honey)',
    'category': 'Oriental Sweets',
    'Size': 'Plate',
    'category_id': 2,
    'isBestSeller': true,
    'isDiscount': false,
    'discount': 0.0,
    'oldPrice': 0.0,
  },
  {
    'image':
        'https://github.com/RihamAhmed16/Mo-Taxi/blob/master/assets/assets_firebase/desserts/Swiss%20Black%20Forest%20Gateau.png?raw=true',
    'name': 'Swiss Black Forest Gateau Dis',
    'code': '1380111',
    'price': '30',
    'number_in_cart': 0,
    'rating': 2.0,
    'created_at': FieldValue.serverTimestamp(),
    'descriptions':
        'Fudge sponge cake stuffed with vanilla cream, cherry jam and milk chocolate shredded with honey (The product may differ from the image daily)',
    'category': 'Oriental Sweets',
    'Size': 'Piece',
    'category_id': 2,
    'isBestSeller': true,
    'isDiscount': false,
    'discount': 0.0,
    'oldPrice': 0.0,
  },
  {
    'image':
        'https://github.com/RihamAhmed16/Mo-Taxi/blob/master/assets/assets_firebase/oriental_sweets/Large%20Mix%20Lux%20Box%20-%2050%20Pcs.png?raw=true',
    'name': 'Large Mix Lux Box - 50 Pcs',
    'code': '960007',
    'price': '245',
    'number_in_cart': 0,
    'rating': 4.0,
    'created_at': FieldValue.serverTimestamp(),
    'descriptions':
        '16 pieces of plain basbousa - 3 pieces of plain konafa - 6 pieces of kunafa with cream- 4 pieces of golash with cream - 2 swabe\' zainab - 2 Balah el sham - 2 Zalabya - 8 plain remosh - 4 plain golash - 3 baklava with hazelnuts - 4 kunafa with nuts - 2 Burma with Hazelnut--The number of pieces is approximate',
    'category': 'Oriental Sweets',
    'Size': 'Box',
    'category_id': 2,
    'isBestSeller': true,
    'isDiscount': false,
    'discount': 0.0,
    'oldPrice': 0.0,
  },
  {
    'image':
        'https://github.com/RihamAhmed16/Mo-Taxi/blob/master/assets/assets_firebase/oriental_sweets/Sable%20and%20Tart%20Packet%20-%2012%20Pcs.png?raw=true',
    'name': 'Sable and Tart Packet - 12 Pcs',
    'code': '170132',
    'price': '80',
    'number_in_cart': 0,
    'rating': 2.0,
    'created_at': FieldValue.serverTimestamp(),
    'descriptions':
        'It consists of (flour - natural butter - powdered sugar - pasteurized eggs - white ganache - chocolate ganache - nuts - jam - sesame)',
    'category': 'Oriental Sweets',
    'Size': 'Plate',
    'category_id': 2,
    'isBestSeller': false,
    'isDiscount': false,
    'discount': 0.0,
    'oldPrice': 0.0,
  },
  {
    'image':
        'https://github.com/RihamAhmed16/Mo-Taxi/blob/master/assets/assets_firebase/oriental_sweets/Rice%20Pudding%20Qonbela%20-Dis.png?raw=true',
    'name': 'Rice Pudding Qonbela -Dis',
    'code': '1380170',
    'price': '38.50',
    'number_in_cart': 0,
    'rating': 3.0,
    'created_at': FieldValue.serverTimestamp(),
    'descriptions': 'Rice Pudding Qonbela -Dis',
    'category': 'Oriental Sweets',
    'Size': 'Plate',
    'category_id': 2,
    'isBestSeller': false,
    'isDiscount': true,
    'discount': 30.0,
    'oldPrice': 55.0,
  },
  {
    'image':
        'https://github.com/RihamAhmed16/Mo-Taxi/blob/master/assets/assets_firebase/oriental_sweets/Plain%20Ghorayeba%20Packet%20-%2015%20Pcs.png?raw=true',
    'name': 'Plain Ghorayeba Packet - 15 Pcs',
    'code': '170134',
    'price': '29',
    'number_in_cart': 0,
    'rating': 2.0,
    'created_at': FieldValue.serverTimestamp(),
    'descriptions': 'It consists of (flour - natural butter - sugar - powder)',
    'category': 'Oriental Sweets',
    'Size': 'Packet',
    'category_id': 2,
    'isBestSeller': false,
    'isDiscount': true,
    'discount': 40.0,
    'oldPrice': 48.0,
  },
  {
    'image':
        'https://github.com/RihamAhmed16/Mo-Taxi/blob/master/assets/assets_firebase/oriental_sweets/Petit%20Four%20Packet%20-%2012%20Pcs.png?raw=true',
    'name': 'Plain Ghorayeba Packet - 15 Pcs',
    'code': '170131',
    'price': '45',
    'number_in_cart': 0,
    'rating': 3.0,
    'created_at': FieldValue.serverTimestamp(),
    'descriptions':
        'It consists of (flour - natural butter - pasteurized eggs - powdered sugar - vanilla - cocoa - chocolate - jam - nuts - crushed hazelnuts - crushed pistachios)',
    'category': 'Oriental Sweets',
    'Size': 'Plate',
    'category_id': 2,
    'isBestSeller': false,
    'isDiscount': false,
    'discount': 0.0,
    'oldPrice': 0.0,
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
