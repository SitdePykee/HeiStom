// import 'package:flutter/material.dart';
// import 'package:heistom/common/domain/entity/bill_entity.dart';
// import 'package:heistom/common/global_controller.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';

// class BillReviewPage extends StatelessWidget {
//   BillReviewPage({super.key, required this.bill});
//   final BillEntity bill;
//   final GlobalController globalController = Get.find<GlobalController>();

//   String formatDate(num milliseconds) {
//     DateTime dateTime =
//         DateTime.fromMillisecondsSinceEpoch(milliseconds.toInt());
//     return DateFormat('dd/MM/yyyy HH:mm').format(dateTime);
//   }

//   showConfirmationDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text('Thanh toán'),
//           content: Text('Số tiền: ${bill.totalPrice} VNĐ'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Get.back();
//               },
//               child: const Text('Hủy'),
//             ),
//             TextButton(
//               onPressed: () {
//                 Get.back();
//               },
//               child: const Text('Chuyển hướng tới ngân hàng'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   RxString paymentMethod = 'Chuyển khoản'.obs;
//   @override
//   Widget build(BuildContext context) {
//     bool isHourlyRented = bill.checkOutDate! - bill.checkInDate! < 86400000;
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         backgroundColor: const Color(0xffF7F7F7),
//         title: Row(
//           children: [
//             Container(
//               width: 48,
//               height: 48,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(12),
//                 image: DecorationImage(
//                   image: NetworkImage(globalController.user.avatar!),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             const SizedBox(width: 12),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Text(
//                   'Chào buổi sáng',
//                   style: TextStyle(
//                     fontSize: 12,
//                     fontWeight: FontWeight.w400,
//                     color: Colors.black87,
//                   ),
//                 ),
//                 Text(
//                   globalController.user.name!,
//                   style: const TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.black,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//       body: Column(
//         children: [
//           SizedBox(
//             height: 23,
//           ),
//           Center(
//             child: Text(bill.lodging?.name ?? 'Lodging Name',
//                 style: const TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.black,
//                 )),
//           ),
//           const SizedBox(
//             height: 23,
//           ),
//           InfoSection(
//             bill: bill,
//             isHourlyRented: isHourlyRented,
//             title: 'THÔNG TIN ĐẶT PHÒNG',
//             left: ['Số phòng', 'Số người', 'Phí'],
//             right: [
//               bill.room?.map((e) => e.id).join(', ') ?? 'Room ID',
//               bill.numberOfPeople.toString(),
//               isHourlyRented
//                   ? '${bill.lodging?.hourPrice}đ/giờ'
//                   : '${bill.lodging?.dayPrice}đ/ngày',
//             ],
//           ),
//           const SizedBox(
//             height: 12,
//           ),
//           InfoSection(
//             bill: bill,
//             isHourlyRented: isHourlyRented,
//             title: 'THÔNG TIN KHÁCH HÀNG',
//             left: ['Tên', 'Email', 'Số điện thoại'],
//             right: [
//               bill.user?.name ?? 'User Name',
//               bill.user?.email ?? 'User Email',
//               bill.user?.phone ?? 'User Phone',
//             ],
//           ),
//           const SizedBox(
//             height: 12,
//           ),
//           InfoSection(
//             bill: bill,
//             isHourlyRented: isHourlyRented,
//             title: 'THỜI GIAN ĐẶT PHÒNG',
//             left: ['Check-in', 'Check-out', 'Số ngày ở'],
//             right: [
//               formatDate(bill.checkInDate!),
//               formatDate(bill.checkOutDate!),
//               isHourlyRented
//                   ? '${((bill.checkOutDate! - bill.checkInDate!) / 3600000).toStringAsFixed(0)} giờ'
//                   : '${((bill.checkOutDate! - bill.checkInDate!) / 86400000).toStringAsFixed(0)} ngày',
//             ],
//           ),
//           const SizedBox(
//             height: 12,
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 21.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'THANH TOÁN',
//                   style: const TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.black,
//                   ),
//                 ),
//                 Obx(
//                   () => DropdownButton(
//                       value: paymentMethod.value,
//                       items: [
//                         DropdownMenuItem(
//                           child: Text('Chuyển khoản'),
//                           value: 'Chuyển khoản',
//                         ),
//                         DropdownMenuItem(
//                           child: Text('Tiền mặt'),
//                           value: 'Tiền mặt',
//                         ),
//                       ],
//                       onChanged: (value) {
//                         paymentMethod.value = value!;
//                       }),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(
//             width: 12,
//           ),
//           Divider(
//             color: const Color(0xffE4E7EB),
//             thickness: 1,
//           ),
//           const SizedBox(
//             width: 12,
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 21.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'TỔNG TIỀN',
//                   style: const TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//                 Text(
//                   '${bill.totalPrice!.toInt()}VNĐ',
//                   style: const TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.w700,
//                     color: Color(0xffEBA731),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Spacer(),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               TextButton(
//                 onPressed: () {},
//                 style: ButtonStyle(
//                   backgroundColor: WidgetStateProperty.all(Colors.red),
//                 ),
//                 child: Text('Hủy phòng',
//                     style: const TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w500,
//                       color: Colors.black,
//                     )),
//               ),
//               TextButton(
//                 onPressed: () {},
//                 style: ButtonStyle(
//                   backgroundColor: WidgetStateProperty.all(Colors.green),
//                 ),
//                 child: Text('Xong',
//                     style: const TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w500,
//                       color: Colors.black,
//                     )),
//               ),
//             ],
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//         ],
//       ),
//     );
//   }
// }

// class InfoSection extends StatelessWidget {
//   const InfoSection({
//     super.key,
//     required this.bill,
//     required this.isHourlyRented,
//     required this.left,
//     required this.right,
//     this.title,
//   });

//   final BillEntity bill;
//   final bool isHourlyRented;
//   final List<String> left;
//   final List<String> right;
//   final String? title;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(left: 20),
//           child: Text(title ?? 'TITLE',
//               style: const TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.w400,
//                 color: Colors.black,
//               )),
//         ),
//         const SizedBox(
//           height: 13,
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 30),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: left
//                     .map((e) => Column(
//                           children: [
//                             Text(
//                               e,
//                               style: const TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w400,
//                                 color: Color(0xff7F868A),
//                               ),
//                             ),
//                             const SizedBox(height: 8),
//                           ],
//                         ))
//                     .toList(),
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: right
//                     .map((e) => Column(
//                           children: [
//                             Text(
//                               e,
//                               style: const TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w400,
//                                 color: Colors.black,
//                               ),
//                             ),
//                             const SizedBox(height: 8),
//                           ],
//                         ))
//                     .toList(),
//               ),
//             ],
//           ),
//         ),
//         const SizedBox(
//           height: 12,
//         ),
//         const Divider(
//           color: Color(0xffE4E7EB),
//           thickness: 1,
//         ),
//       ],
//     );
//   }
// }
