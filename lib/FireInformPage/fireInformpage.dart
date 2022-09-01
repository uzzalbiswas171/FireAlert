import 'package:fireapp/CoustomWidget/TextfieldWidget/textfieldwidget.dart';
import 'package:flutter/material.dart';

class FireInformPage extends StatefulWidget {
  const FireInformPage({Key? key}) : super(key: key);

  @override
  State<FireInformPage> createState() => _FireInformPageState();
}

class _FireInformPageState extends State<FireInformPage> {
  TextEditingController _DistrictController = TextEditingController();
  bool _ISObcicure = false;

  DateTime currentTime = new DateTime.now();

  List<String> DistrictList=[
    "Dhaka District",                //dhaa divi
    "Faridpur District",
    "Gazipur District",
    "Gopalganj District",
    "Kishoreganj District",
    "Madaripur District",
    "Manikganj District",
    "Munshiganj District",
    "Narayanganj District",
    "Narsingdi District",
    "Rajbari District",
    "Shariatpur District",
    "Tangail District",
    "Bandarban District",           //Chitta gong
    "Brahmanbaria District",
    "Chandpur District",
    "Chattogram District",
    "Cox’s Bazar District",
    "Cumilla District",
    "Feni District",
    "Khagrachhari District",
    "Lakshmipur District",
    "Noakhali District",
    "Rangamati  District",           //barishal
    "Barguna District",
    "Barishal District",
    "Bhola District",
    "Jhalokati District",
    "Patuakhali District",
    "Pirojpur District",
    "Bagerhat District",         //hulna
    "Chuadanga District",
    "Jashore District",
    "Jhenaidah District",
    "Khulna District",
    "Kushtia District",
    "Magura District",
    "Meherpur District",
    "Narail District",
    "Satkhira District"	,
    "Jamalpur District",      //mynshin
    "Mymensingh District",
    "Netrokona District",
    "Sherpur District",
    "Bogura District",        //rajshi
    "Joypurhat District",
    "Naogaon District",
    "Natore District",
    "Chapainawabganj",
    "Pabna District",
    "Rajshahi District",
    "Sirajganj District",
    "Dinajpur District",      //rangpur
    "Gaibandha District",
    "Kurigram District",
    "Lalmonirhat District",
    "Nilphamari District",
    "Panchagarh District",
    "Rangpur District",
    "Thakurgaon District",
    "Habiganj District",        //sylhet
    "Moulvibazar District",
    "Sunamganj District",
    "Sylhet District",
  ];

  @override
  Widget build(BuildContext context) {
    String TimeNow=currentTime.toString();
    return Scaffold(
      backgroundColor: Colors.amber,

      body: Container(
        alignment: Alignment.center,
        height: double.infinity,
        width: double.infinity,
        color: Colors.black54,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: 20,
                ),
                alignment: Alignment.center,
                child: Text("Today",style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 22,
                  color: Colors.white,
                ),),
              ),
              Container(
                alignment: Alignment.center,
                height: 50,
                width: double.infinity,
                child: Text(TimeNow,style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w600
                ),),
              ),

              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(10),
                width: double.infinity,
                height: MediaQuery.of(context).size.height*.8,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22.00),
                ),
                child: Column(
                  children: [
                    SingleChildScrollView(
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                          bottom: 10,
                          top: 10
                        ),
                        height: 70,
                        width: double.infinity,
                        child: TextfieldWidget(
                          hintText: "DISTRICT / SUB DISTRICT",
                          controller: _DistrictController,
                          obscuretext: _ISObcicure,
                          prefixiconButton: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.search,
                                color: Colors.white,
                                size: 33,
                              )),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(22),
                          border: Border.all(
                            width: 2,
                            color: Colors.white,
                          )
                        ),
                      ),
                    ),
                              SizedBox(height: 10,),
                    Expanded(
                      child: Container(
                        height: 600,
                        width: double.infinity,
                        child: ListView.builder(
                            scrollDirection:Axis.vertical,
                            itemCount: DistrictList.length,
                            itemBuilder: (context, index){
                              return InkWell(
                                onTap: (){
                                  if(DistrictList[index]=="Dhaka District"){
                                    showModalBottomSheet(
                                        isDismissible: true,
                                        context: context, builder: (context){
                                      return Container(
                                        height: 600,
                                        width: 300,
                                        color: Colors.red,
                                        child: Text("${DistrictList[index]}"),
                                      );
                                    });
                                  }
                                  else if(DistrictList[index]=="Faridpur District"){
                                    showModalBottomSheet(
                                        isDismissible: true,
                                        context: context, builder: (context){
                                      return Container(
                                        height: 600,
                                        width: 300,
                                        color: Colors.green,
                                        child: Text("${DistrictList[index]}"),
                                      );
                                    });
                                  }
                                  else{
                                    showModalBottomSheet(
                                        isDismissible: true,
                                        context: context, builder: (context){
                                      return Container(
                                        height: 600,
                                        width: 300,
                                        color: Colors.green,
                                        child: Text(" Warning"),
                                      );
                                    });
                                  }
                                },
                                child: Container(
                                  height: 60,
                                  margin: EdgeInsets.only(
                                      top: 10
                                  ),
                                  decoration:BoxDecoration(
                                    color: Colors.indigoAccent[100],
                                    borderRadius: BorderRadius.circular(11),
                                  ),
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      backgroundColor: Colors.red,
                                    ),
                                    trailing: Text("${DistrictList[index]}",style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                    ),),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),
                  ],
                ),
              ),
             
            ],
          ),
        ),
      ),
    );
  }
}
