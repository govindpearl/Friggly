import 'package:flutter/material.dart';

class Leaderboardscreen extends StatefulWidget {
  const Leaderboardscreen({Key? key}) : super(key: key);

  @override
  State<Leaderboardscreen> createState() => _LeaderboardscreenState();
}

class _LeaderboardscreenState extends State<Leaderboardscreen> {

  @override
  Widget build(BuildContext context) {
    bool small = false;
    return   Scaffold(
      //backgroundColor: white,
      body:
      DefaultTabController(
        length: 3,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/frigglybg2.jpg"),
                fit: BoxFit.cover,
              )),
          padding: const EdgeInsets.only(top: 2.5),
          child: Column(
            children: [

             // const AppBarcomon(),
             // Text("LEADERBOARD",style: TextStyle(fontSize: 40,fontWeight: FontWeight.w700,color: Colors.white),),
              TabBar(
                labelStyle: TextStyle(fontSize: small ? 15.0 : 18.0),
                labelColor: Colors.orangeAccent,
                indicatorColor: Color(0xffFFCD46),

                unselectedLabelColor: Colors.white,
                tabs:  [
                  Tab(
                    text: 'FRIENDS',
                  ),
                  Tab(
                    text: 'COUNTRY',
                  ),
                  Tab(
                    text: 'GLOBAL',
                  ),
                ],
              ),
              Expanded(
                  child: TabBarView(
                    children: [
                      friendswidget(),
                      countrywidget(),
                      globalwidget(),
                    ],
                  ))
            ],
          ),
        ),),
    );
  }

  Widget friendswidget(){

    return
    SingleChildScrollView(
      child: Padding(
        padding:  EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              //height: 333,
              child: Stack(
                children: [

                  Padding(
                    padding: const EdgeInsets.only(top: 50,left: 25,right: 25,bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Positioned(
                          top: 50,
                          bottom: 2,
                          child: Column(children: [
                            Column(
                              children: [
                                Text("2",style: TextStyle(color: Colors.white),),
                                Icon(Icons.arrow_drop_up_outlined,color: Colors.green,)
                              ],
                            ),
                            SizedBox(
                              height:100,
                              width: 100,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  //onTap: imagePickerOption,
                                  child: Image.network("https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",fit: BoxFit.fill,)
                              ),
                            ),
                            Text("Govind",style:TextStyle(color: Colors.white),),
                            Text("7687768881",style:TextStyle(color: Colors.orangeAccent),),
                          ],),
                        ),
                        Column(children: [
                          Column(
                            children: [
                              Text("3",style: TextStyle(color: Colors.white),),
                              Icon(Icons.arrow_drop_up_outlined,color: Colors.green,)
                            ],
                          ),
                          SizedBox(
                            height:100,
                            width: 100,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                //onTap: imagePickerOption,
                                child: Image.network("https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",fit: BoxFit.fill,)
                            ),
                          ),
                          Text("Govind",style:TextStyle(color: Colors.white),),
                          Text("7687768881",style:TextStyle(color: Colors.orangeAccent),),
                        ],),
                      ],),
                  ),
                  Center(
                    child: Positioned(

                     // left: 92,
                      //bottom: 22,
                      top: 5,
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Text("1",style: TextStyle(color: Colors.white),),
                              Icon(Icons.arrow_drop_up_outlined,color: Colors.green,)                            ],
                          ),
                        SizedBox(
                          height:130,
                          width: 130,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              //onTap: imagePickerOption,
                              child: Image.network("https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",fit: BoxFit.fill,)
                          ),
                        ),
                        Text("Govind Kumar",style:TextStyle(color: Colors.white),),
                        Text("7687768881",style:TextStyle(color: Colors.orangeAccent),),
                      ],),
                    ),
                  ),

                ],
              ),
            ),

            ListView.builder(
             // separatorBuilder: (BuildContext context, int index) => const Divider(),
              shrinkWrap: true,
              physics:  NeverScrollableScrollPhysics(),
              //itemBuilder: (context , int index){
              itemBuilder: (BuildContext ctxt, int Index){
                final int count =4+Index;
                return
                  Row(
                    children: [
                      Column(
                        children: [
                          Text(count.toString(),style: TextStyle(color: Colors.white),),
                          Icon(Icons.arrow_drop_up_outlined,color: Colors.green,)
                        ],
                      ),

                      Expanded(
                        flex: 1,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Colors.greenAccent,
                            ),
                            borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
                          ),
                          //BCF7E3
                          color: Color(0xff034C38),
                          child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height:70,
                              width: 70,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  //onTap: imagePickerOption,
                                  child: Image.network("https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",fit: BoxFit.fill,)
                              ),
                            ),
                            SizedBox(width: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Govind kumar",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20,color: Colors.white),),
                                Text("7898778879",style: TextStyle(color: Colors.green),),
                              ],),
                                      ],
                ),
                        ),
                      ),
                    ],
                  );

              },
              itemCount: 25,
            ),
          ],
        ),
      ),
    );
  }


  Widget countrywidget() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            //height: 333,
            child: Stack(
              children: [

                Padding(
                  padding: const EdgeInsets.only(
                      top: 50, left: 25, right: 25, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Positioned(
                        top: 50,
                        bottom: 2,
                        child: Column(children: [
                          Column(
                            children: [
                              Text("2", style: TextStyle(color: Colors.white),),
                              Icon(Icons.arrow_drop_up_outlined,
                                color: Colors.green,)
                            ],
                          ),
                          SizedBox(
                            height: 100,
                            width: 100,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                //onTap: imagePickerOption,
                                child: Image.network(
                                  "https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
                                  fit: BoxFit.fill,)
                            ),
                          ),
                          Text("Amit",
                            style: TextStyle(color: Colors.white),),
                          Text("7687768881",
                            style: TextStyle(color: Colors.orangeAccent),),
                        ],),
                      ),
                      Column(children: [
                        Column(
                          children: [
                            Text("3", style: TextStyle(color: Colors.white),),
                            Icon(Icons.arrow_drop_up_outlined,
                              color: Colors.green,)
                          ],
                        ),
                        SizedBox(
                          height: 100,
                          width: 100,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              //onTap: imagePickerOption,
                              child: Image.network(
                                "https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
                                fit: BoxFit.fill,)
                          ),
                        ),
                        Text("Govind", style: TextStyle(color: Colors.white),),
                        Text("7687768881", style: TextStyle(color: Colors
                            .orangeAccent),),
                      ],),
                    ],),
                ),
                Center(
                  child: Positioned(

                    // left: 92,
                    //bottom: 22,
                    top: 5,
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Text("1", style: TextStyle(color: Colors.white),),
                            Icon(Icons.arrow_drop_up_outlined,
                              color: Colors.green,)
                          ],
                        ),
                        SizedBox(
                          height: 130,
                          width: 130,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              //onTap: imagePickerOption,
                              child: Image.network(
                                "https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
                                fit: BoxFit.fill,)
                          ),
                        ),
                        Text("Vipin Kumar", style: TextStyle(color: Colors
                            .white),),
                        Text("7687768881", style: TextStyle(color: Colors
                            .orangeAccent),),
                      ],),
                  ),
                ),

              ],
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              child: ListView.builder(
                // separatorBuilder: (BuildContext context, int index) => const Divider(),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                //itemBuilder: (context , int index){
                itemBuilder: (BuildContext ctxt, int Index) {
                  final int count = 4 + Index;
                  return
                    Row(
                      children: [
                        Column(
                          children: [
                            Text(count.toString(), style: TextStyle(
                                color: Colors.white),),
                            Icon(Icons.arrow_drop_up_outlined, color: Colors
                                .green,)
                          ],
                        ),

                        Expanded(
                          flex: 1,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Colors.greenAccent,
                              ),
                              borderRadius: BorderRadius.circular(
                                  20.0), //<-- SEE HERE
                            ),
                            //BCF7E3
                            color: Color(0xff034C38),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: 70,
                                  width: 70,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      //onTap: imagePickerOption,
                                      child: Image.network(
                                        "https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
                                        fit: BoxFit.fill,)
                                  ),
                                ),
                                SizedBox(width: 10,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Vipin kumar", style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20,
                                        color: Colors.white),),
                                    Text("7898778879",
                                      style: TextStyle(color: Colors.green),),
                                  ],),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                },
                itemCount: 25,
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget globalwidget() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            //height: 333,
            child: Stack(
              children: [

                Padding(
                  padding: const EdgeInsets.only(
                      top: 50, left: 25, right: 25, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Positioned(
                        top: 50,
                        bottom: 2,
                        child: Column(children: [
                          Column(
                            children: [
                              Text("2", style: TextStyle(color: Colors.white),),
                              Icon(Icons.arrow_drop_up_outlined,
                                color: Colors.green,)
                            ],
                          ),
                          SizedBox(
                            height: 100,
                            width: 100,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                //onTap: imagePickerOption,
                                child: Image.network(
                                  "https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
                                  fit: BoxFit.fill,)
                            ),
                          ),
                          Text("Amit",
                            style: TextStyle(color: Colors.white),),
                          Text("7687768881",
                            style: TextStyle(color: Colors.orangeAccent),),
                        ],),
                      ),
                      Column(children: [
                        Column(
                          children: [
                            Text("3", style: TextStyle(color: Colors.white),),
                            Icon(Icons.arrow_drop_up_outlined,
                              color: Colors.green,)
                          ],
                        ),
                        SizedBox(
                          height: 100,
                          width: 100,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              //onTap: imagePickerOption,
                              child: Image.network(
                                "https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
                                fit: BoxFit.fill,)
                          ),
                        ),
                        Text("Govind", style: TextStyle(color: Colors.white),),
                        Text("7687768881", style: TextStyle(color: Colors
                            .orangeAccent),),
                      ],),
                    ],),
                ),
                Center(
                  child: Positioned(

                    // left: 92,
                    //bottom: 22,
                    top: 5,
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Text("1", style: TextStyle(color: Colors.white),),
                            Icon(Icons.arrow_drop_up_outlined,
                              color: Colors.green,)
                          ],
                        ),
                        SizedBox(
                          height: 130,
                          width: 130,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              //onTap: imagePickerOption,
                              child: Image.network(
                                "https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
                                fit: BoxFit.fill,)
                          ),
                        ),
                        Text("Vipin Kumar", style: TextStyle(color: Colors
                            .white),),
                        Text("7687768881", style: TextStyle(color: Colors
                            .orangeAccent),),
                      ],),
                  ),
                ),

              ],
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              child: ListView.builder(
                // separatorBuilder: (BuildContext context, int index) => const Divider(),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                //itemBuilder: (context , int index){
                itemBuilder: (BuildContext ctxt, int Index) {
                  final int count = 4 + Index;
                  return
                    Row(
                      children: [
                        Column(
                          children: [
                            Text(count.toString(), style: TextStyle(
                                color: Colors.white),),
                            Icon(Icons.arrow_drop_up_outlined, color: Colors
                                .green,)
                          ],
                        ),

                        Expanded(
                          flex: 1,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Colors.greenAccent,
                              ),
                              borderRadius: BorderRadius.circular(
                                  20.0), //<-- SEE HERE
                            ),
                            //BCF7E3
                            color: Color(0xff034C38),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: 70,
                                  width: 70,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      //onTap: imagePickerOption,
                                      child: Image.network(
                                        "https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
                                        fit: BoxFit.fill,)
                                  ),
                                ),
                                SizedBox(width: 10,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Amit kumar", style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20,
                                        color: Colors.white),),
                                    Text("7898778879",
                                      style: TextStyle(color: Colors.green),),
                                  ],),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                },
                itemCount: 25,
              ),
            ),
          ),
        ],
      ),
    );
  }

}
