import 'package:etoile_app/bussines_logic/orders_cubit/orders_cubit.dart';
import 'package:etoile_app/constance/colors.dart';
import 'package:etoile_app/constance/strings.dart';
import 'package:etoile_app/core/DI/dependency_injecion.dart';
import 'package:etoile_app/data/models/order_model.dart';
import 'package:etoile_app/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/methods/formate_time.dart';

class MyOrder extends StatefulWidget {
  const MyOrder({super.key});

  @override
  State<MyOrder> createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  @override
  void initState() {
    serviceLocator.get<OrdersCubit>().getOrders();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Orders',
          style: TextStyle(color: AppColors.lightBlack),
        ),
      ),
      body: BlocBuilder<OrdersCubit,OrdersState>(
        builder: (context, state) {
          var cubit = context.read<OrdersCubit>();
          if (state is GetOrdersSuccess) {
            return ListView.builder(
                itemCount: cubit.orders.length,
                itemBuilder: (context, index) {
                  return OrderItem(orderModel: cubit.orders[index],);
                });
          } else if (state is GetOrdersLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.buttonColor,
              ),
            );
          } else {
            return const Center(
              child: Text('you haven\'t orders yet'),
            );
          }
        },
      ),
    );
  }
}

class OrderItem extends StatelessWidget {
  const OrderItem({
    super.key,
    required this.orderModel,
  });

  final OrderModel orderModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0.h,vertical: 6.h),
      child: Column(
        children: [
          Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 4,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 12.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Order Number :'),
                      SizedBox(
                        height: 6.h,
                      ),
                      const Text('Date :'),
                      SizedBox(
                        height: 6.h,
                      ),
                      const Text('Total Amount :'),
                      SizedBox(
                        height: 6.h,
                      ),
                      const Text('Status :'),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('#00${orderModel.orderNumber}'),
                      SizedBox(
                        height: 6.h,
                      ),
                      Text(
                        formatTime(
                          timestamp: orderModel.createdAt,
                        ),
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      Text('${orderModel.totalAMount} EGP'),
                      SizedBox(
                        height: 6.h,
                      ),
                      const Text(
                        'In Store',
                        style: TextStyle(color: Colors.green),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomButton(
                          text: 'Details',
                          onPressed: (){
                            Navigator.pushNamed(context,Routes.orderDetails,arguments: orderModel);
                          },
                          width: 100.w,
                          buttonColor: AppColors.buttonColor),
                      CustomButton(
                          text: 'Track',
                          width: 100.w,
                          buttonColor: AppColors.lightBlack),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
