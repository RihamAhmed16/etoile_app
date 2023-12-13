// import 'package:flutter/material.dart';
//
// import 'search_cubit.dart';
//
// class Search extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My App'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.search),
//             onPressed: () {
//               showSearch(
//                 context: context,
//                 delegate: SearchDelegate<String>(
//                   searchFieldLabel: 'Search...',
//                   onSubmitted: (query) {
//                     context.read<SearchCubit>().search(query);
//                   },
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//       body: BlocBuilder<SearchCubit, String>(
//         builder: (context, state) {
//           return Center(
//             child: Text('Search query: $state'),
//           );
//         },
//       ),
//     );
//   }
// }