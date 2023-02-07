// import 'package:flutter/material.dart';
// import 'package:gmap_latlng_demo/Pages/Panel/layouts/bar.dart';
// import 'package:gmap_latlng_demo/Pages/Panel/layouts/options.dart';

// import '../../Constants/global.dart';
// import '../../Services/Api/attendence_status.dart';
// import 'Widgets/remark_box.dart';
// import 'Widgets/select_image.dart';
// import 'layouts/images.dart';
// import 'layouts/remark.dart';

// class PanelWidget extends StatefulWidget {
//   const PanelWidget({Key? key}) : super(key: key);

//   @override
//   State<PanelWidget> createState() => _PanelWidgetState();
// }

// class _PanelWidgetState extends State<PanelWidget> {
//   // late DraggableScrollableController _sheetcontroller;

//   @override
//   void initState() {
//     super.initState();
//     listeners.panelitem.setcapture = listeners.panelitem.setremark = false;
//     getAttendencetoday();
//     // showModalBottomSheet(
//     //     context: context,
//     //     builder: (BuildContext context) => buildbottomsheet());
//     // _sheetcontroller = DraggableScrollableController();
//   }

//   @override
//   void didChangeDependencies() {
//     listeners.panelitem.getcapture;
//     listeners.panelitem.getremark;
//     super.didChangeDependencies();
//   }

//   @override
//   void dispose() {
//     // _sheetcontroller;
//     super.dispose();
//   }

//   // @override
//   // Widget build(BuildContext context) {
//   //   return DraggableScrollableSheet(
//   //       controller: _sheetcontroller,
//   //       initialChildSize: .1,
//   //       minChildSize: .1,
//   //       maxChildSize: 1,
//   //       snapSizes: const [.85, 1],
//   //       expand: false,
//   //       builder: (context, ScrollController scrollController) =>
//   //           ListView(
//   //             controller: scrollController,
//   //               children: <Widget>[
//   //                 const SizedBox(
//   //                   height: 12.0,
//   //                 ),
//   //                 Bar(
//   //                   sheetcontroller: _sheetcontroller,
//   //                 ),
//   //                 SizedBox(
//   //                   height: MediaQuery.of(context).size.height * .08,
//   //                 ),
//   //                 const Options(),
//   //                 const SizedBox(
//   //                   height: 10.0,
//   //                 ),
//   //                 // const ImageVisibilty(),
//   //                 // const Remar(),
//   //                 Visibility(
//   //                   visible: listeners.panelitem.getcapture,
//   //                   child: const SelectImage(),
//   //                 ),
//   //                 Visibility(
//   //                   visible: listeners.panelitem.getremark,
//   //                   child: const RemarkBox(),
//   //                 ),
//   //               ],
//   //           ));
//   // }

//   // @override
//   // Widget build(BuildContext context) {
//   //   return buildbottomsheet();
//   // }

//   // buildbottomsheet() {
//   //   return LayoutBuilder(
//   //     builder: (BuildContext context,BoxConstraints constraints) => BottomSheet(
//   //     constraints: constraints,
//   //       enableDrag: true,

//   //       onClosing: () {},
//   //       builder: (BuildContext context) {
//   //         return ListView(
//   //           children: <Widget>[
//   //             const SizedBox(
//   //               height: 12.0,
//   //             ),
//   //             const Bar(),
//   //             SizedBox(
//   //               height: MediaQuery.of(context).size.height * .08,
//   //             ),
//   //             const Options(),
//   //             const SizedBox(
//   //               height: 10.0,
//   //             ),
//   //             // const ImageVisibilty(),
//   //             // const Remar(),
//   //             Visibility(
//   //               visible: listeners.panelitem.getcapture,
//   //               child: const SelectImage(),
//   //             ),
//   //             Visibility(
//   //               visible: listeners.panelitem.getremark,
//   //               child: const RemarkBox(),
//   //             ),
//   //           ],
//   //         );
//   //       })
//   //   );
//   // }
// }
