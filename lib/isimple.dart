library isimple;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isimple/src/bloc/apibloc.dart';

import 'src/models/api_response.dart';
import 'src/models/isimpleproduct.dart';
import 'src/widgets/errorpanel.dart';
import 'src/widgets/loadinglayout.dart';
import 'src/widgets/product_item.dart';

class ICodeTujuan {
  ICodeTujuan(
      {required this.tujuan,
      required this.code,
      required this.product,
      required this.price});
  String tujuan;
  IProduct product;
  String code;
  String price;
}

class ISimplePage extends StatefulWidget {
  final String baseurl;
  final int userid;
  final String title;
  final Function(ICodeTujuan) onSelect;
  const ISimplePage(
      {super.key,
      required this.baseurl,
      required this.userid,
      required this.title,
      required this.onSelect});

  @override
  State<ISimplePage> createState() => _ISimplePageState();
}

class _ISimplePageState extends State<ISimplePage> {
  final ISimpleBloc bloc = ISimpleBloc(burl: "");
  final TextEditingController _txtnomor = TextEditingController(text: "");

  @override
  void initState() {
    super.initState();
    bloc.baseurl = widget.baseurl;
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.yellow.shade600,
        titleSpacing: 0,
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () {
                bloc.getProduct();
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: Column(
        children: [
          Container(
            margin:
                const EdgeInsets.only(top: 16, right: 8, left: 8, bottom: 8),
            child: TextField(
              textInputAction: TextInputAction.search,
              onSubmitted: (text){
                bloc.getProduct();
              },
              style: const TextStyle(fontSize: 20),
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(16),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red.shade800)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red.shade800)),
                  filled: true,
                  label: const Text("Masukkan Nomor")
              ),
              controller: _txtnomor,
            ),
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.grey[300],
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              child: Text(
                "Pilih Produk",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: ScreenUtil().setSp(16)),
              )),
          Expanded(
              child: StreamBuilder<ApiResponse<IsimpleProductResponse>>(
                  stream: bloc.productStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data!.status == Status.LOADING) {
                        return const LoadingLayout();
                      }
                      if (snapshot.data!.status == Status.ERROR) {
                        return ErrorPanel(
                            title: "Ops:${snapshot.data!.message!}",
                            onclick: () => bloc.getProduct());
                      }
                      if (snapshot.data!.status == Status.COMPLETED) {
                        return ListView.separated(
                            separatorBuilder: (context, index) =>
                                 Container(),
                            primary: false,
                            shrinkWrap: true,
                            itemCount: snapshot.data!.data.data.length,
                            itemBuilder: ((context, index) {
                              return PrductItem(
                                  product: snapshot.data!.data.data[index],
                                  ontap: (p0) => widget.onSelect(ICodeTujuan(
                                      tujuan: _txtnomor.text,
                                      product: snapshot.data!.data.data[index],
                                      code: snapshot
                                          .data!.data.data[index].dnmcode,
                                      price: snapshot
                                          .data!.data.data[index].amount)));
                            }));
                      }
                    }
                    return Container();
                  }))
        ],
      ),
    );
  }
}
