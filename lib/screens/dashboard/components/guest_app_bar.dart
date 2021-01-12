// import 'package:flutter/material.dart';
// import 'package:papasi/screens/components/icon_button.dart';
// import 'package:papasi/screens/constant.dart';

// class GuestAppBar extends StatelessWidget {
//   final Function onTapSignIn;

//   const GuestAppBar({
//     Key key,
//     this.onTapSignIn,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//               color: Colors.grey.withAlpha(50),
//               blurRadius: 6,
//               offset: Offset(0, 6)),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Text(
//             "Welcome, Good morning",
//             style: TextStyle(
//               fontSize: 14,
//               color: kGrey,
//             ),
//           ),
//           SizedBox(
//             height: 8,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               CustomIconButton(
//                 color: kPrimery,
//                 text: "Get Info",
//                 onTap: () {},
//                 image: "assets/icons/info.png",
//               ),
//               CustomIconButton(
//                 color: kPrimery,
//                 text: "sign in",
//                 onTap: onTapSignIn,
//                 image: "assets/icons/user-signin.svg",
//               )
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
