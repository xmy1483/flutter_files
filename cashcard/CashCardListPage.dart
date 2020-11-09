import 'package:flutter/material.dart';
import '../common/ActionBar.dart';
import 'CashCardDetailPage.dart';

// 界面根view
class CashCardRoot extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        backgroundColor: Color.fromRGBO(232, 232, 232, 1),
        body: BodyView(),
      ),
    );
  }
}

// body部分
class BodyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: [
        ActionBar(title: "定额卡"), // 标题栏
        Expanded(child: CashCardListView()), // 卡列表
      ],
    );
  }
}

// listView
class CashCardListView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new ListView(
        children: _createListViews()
    );
  }

  _createListViews() {
    List<Widget> views = [
      Align(
        alignment: Alignment.centerLeft,
        child: Text("   定额卡",textAlign: TextAlign.start,style:TextStyle(fontSize: 20,color: Colors.black)),
      ),
      Padding(padding: EdgeInsets.symmetric(vertical: 3,horizontal: 0)),
      CardItemView(price: '2000',originPrice: "11",cardName: "中国石化1000元加油卡",imgPath: "image/c.png"),
      CardItemView(price: '1000',originPrice: "22",cardName: "中国石化1000元加油卡",imgPath: "image/c.png"),
      CardItemView(price: '4000',originPrice: "46",cardName: "中国石化1000元加油卡",imgPath: "image/c.png"),
//    服充卡
      Padding(padding: EdgeInsets.symmetric(vertical: 3,horizontal: 0)),
      Align(alignment: Alignment.centerLeft, child: Text("   中国石化服充卡",textAlign: TextAlign.start,style:TextStyle(fontSize: 20,color: Colors.black)),),
      Padding(padding: EdgeInsets.symmetric(vertical: 3,horizontal: 0)),
      CardItemView(price: '2000',originPrice: "11",cardName: "中国石化1000元加油卡",imgPath: "image/b.png"),
      CardItemView(price: '1000',originPrice: "22",cardName: "中国石化1000元加油卡",imgPath: "image/b.png"),
      CardItemView(price: '4000',originPrice: "46",cardName: "中国石化1000元加油卡",imgPath: "image/b.png"),
      // 底部留白
      Padding(padding: EdgeInsets.only(bottom: 15),),
    ];
    return views;
  }
}

// CardItemView
class CardItemView extends StatelessWidget {
  CardItemView({
    this.price,this.originPrice,this.cardName,this.imgPath
  });

  String price = "0";
  String cardName = "中国石化加油卡";
  String originPrice = "0";
  String imgPath = "image/a.png";
  BuildContext context;
  @override
  Widget build(BuildContext context) {
    this.context = context;
    Widget container =  Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Padding(padding: EdgeInsets.only(left: 10),),
          Expanded(
            flex: 1,
            child: Image.asset(imgPath,fit: BoxFit.cover,),
          ),
          Expanded(
              flex: 2,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(cardName,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    Text("现货包邮，支持持中国石化1000元加油卡，中国石化是什么没听说过",overflow: TextOverflow.fade,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Text("￥"+price+"元", style: TextStyle(fontSize: 17,color: Colors.red,fontWeight: FontWeight.bold),),
                            Padding(padding: EdgeInsets.symmetric(vertical: 0,horizontal: 3)),
                            Text("原价￥"+originPrice+"元", style: TextStyle(decoration: TextDecoration.lineThrough),textAlign: TextAlign.center,),
                          ],
                        ),
                        Text("立即购买>"),
                      ],
                    ),
                  ],
                ),
              )
          )
        ],
      ),
    );

    return GestureDetector(
      child: new Container(
        margin: EdgeInsets.symmetric(vertical: 2,horizontal: 10),
        child: new ClipRRect(
          child: container,
          borderRadius: BorderRadius.circular(10),
        ),
      ),onTap: _onItemClick,
    );
  }

  _onItemClick() {
    print("点击了：" + price);
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return new CashCardDetailPage(paramPrice: 123.123,);
    }));
  }
}
/*

class ActionBar extends StatelessWidget {
  final TextStyle ts = new TextStyle(
    color: Colors.grey,
    backgroundColor: Colors.white,
    decoration: TextDecoration.none,
    fontSize: 20,);

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.only(top:24,bottom: 0),
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 8,horizontal: 10,),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.arrow_back,color: Colors.black,size: 30,),
          Text('定额卡',style: TextStyle(fontSize: 18),),
          Text('')
        ],

      ),
    );


  }
}

*/


