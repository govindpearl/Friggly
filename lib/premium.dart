import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHome extends StatelessWidget {
  final List<String> _tabs = ['Premium', 'Premium Wizard'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: AppBar(
          flexibleSpace: Stack(
            children: <Widget>[
              Positioned.fill(
                child: Image.asset(
                  'assets/mountain.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          title: Text('UPGRADE TO PREMIUM'),
          centerTitle: true,
        ),
      ),
      body: DefaultTabController(
        length: _tabs.length,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50.0),

            child: AppBar(
              backgroundColor: Color(0xff023020),

              bottom: TabBar(
                tabs: _tabs.map((String tab) {
                  return Tab(text: tab);
                }).toList(),
                indicatorColor: Color(0xffFFCD46),
                labelColor: Color(0xffFFCD46),
                unselectedLabelColor: Colors.white,
              ),
            ),
          ),
          body: TabBarView(
            children: [
              PremiumScreen(),
              PremiumWizardScreen(),
            ],
          ),
        ),
      ),
    );
  }
}

class PremiumScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage("assets/darkbg.jpg"),
    fit: BoxFit.cover,
    ),),

        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  color: Colors.transparent,
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: double.infinity,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      SizedBox(height: 5,),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width* 0.7,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.transparent),

                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(

                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),

                                      side: BorderSide(color: Colors.yellow)
                                  )
                              )
                          ),

                          child: Text(
                            'No ads',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width* 0.7,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.transparent),

                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(

                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),

                                      side: BorderSide(color: Colors.yellow)
                                  )
                              )
                          ),

                          child: Text(
                            'Incognito mode',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width* 0.7,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.transparent),

                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(

                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),

                                      side: BorderSide(color: Colors.yellow)
                                  )
                              )
                          ),

                          child: Text(
                            'Advanced spam blocking',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width* 0.7,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.transparent),

                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(

                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),

                                      side: BorderSide(color: Colors.yellow)
                                  )
                              )
                          ),

                          child: Text(
                            'Who viewed my profile',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),

                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width* 0.7,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.transparent),

                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(

                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),

                                      side: BorderSide(color: Colors.yellow)
                                  )
                              )
                          ),

                          child: Text(
                            'Upgrade',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 10),
                    ],
                  ),
                ),

              ),
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child:
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
              width: MediaQuery.of(context).size.width* 0.7,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Color(0xffFFCD46),
                  padding: EdgeInsets.all(16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                child: Text(
                  'Upgrade',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
          )

          ],
          ),
        ),
      ),
    );
  }
}

class PremiumWizardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/darkbg.jpg"),
            fit: BoxFit.cover,
          ),),

        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  color: Colors.transparent,
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: double.infinity,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      SizedBox(height: 5,),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width* 0.7,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.transparent),

                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(

                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),

                                      side: BorderSide(color: Colors.yellow)
                                  )
                              )
                          ),

                          child: Text(
                            'No ads',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width* 0.7,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.transparent),

                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(

                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),

                                      side: BorderSide(color: Colors.yellow)
                                  )
                              )
                          ),

                          child: Text(
                            'Incognito mode',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width* 0.7,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.transparent),

                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(

                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),

                                      side: BorderSide(color: Colors.yellow)
                                  )
                              )
                          ),

                          child: Text(
                            'Advanced spam blocking',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width* 0.7,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.transparent),

                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(

                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),

                                      side: BorderSide(color: Colors.yellow)
                                  )
                              )
                          ),

                          child: Text(
                            'Who viewed my profile',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),

                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width* 0.7,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.transparent),

                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(

                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),

                                      side: BorderSide(color: Colors.yellow)
                                  )
                              )
                          ),

                          child: Text(
                            'View Rating/Reviews of any person',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width* 0.7,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xffFFCD46),
                      padding: EdgeInsets.all(16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    child: Text(
                      'Upgrade',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}