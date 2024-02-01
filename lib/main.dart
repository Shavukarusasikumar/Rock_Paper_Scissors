import 'package:flutter/material.dart';
import 'dart:math';
import 'package:confetti/confetti.dart';
void main(){
  runApp(MyApp(
  ));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
    home: FS(),
    );
  }
}

class FS extends StatefulWidget {
  const FS({super.key});

  @override
  State<FS> createState() => _FSState();
}

class _FSState extends State<FS> {
  var li=['assets/psky1.jpg','assets/rps3.png','assets/rps1.png','assets/rps2.png'];
  int x=0;
  int y=0;
  int y1=0;
  int c1=0;
  var r=Random();
  int fun(int y){
    return y=r.nextInt(3)+1;
  }
  var win='Start';
  final _contorller = ConfettiController();
  bool _isplaying = false;
  @override
  void dispose(){
    super.dispose();
    _contorller.dispose();
  }
  Widget build(BuildContext context) {
    return Container(decoration: BoxDecoration(image: DecorationImage(image: NetworkImage('https://4kwallpapers.com/images/walls/thumbs_3t/1022.jpg'),fit: BoxFit.cover)),
      child: Stack(alignment: Alignment.topCenter,
        children:[ Scaffold(
          body: Container(
            decoration: BoxDecoration(image: DecorationImage(image: NetworkImage('https://4kwallpapers.com/images/walls/thumbs_3t/1022.jpg'),fit: BoxFit.cover)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text('Rock Paper Scissors',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.yellow),),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text('SC :',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.yellow),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text('You :  ',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.orange),),
                          ),
                          Text('$y1',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.yellow)),
                          Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: Text('Comp :  ',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.orange),),
                          ),
                          Text('$c1',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.yellow)),


                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 150,top: 20),
                  child: Container(
                    height: 50,width: 200,
                    child: Text('Computer',style: TextStyle(fontSize: 30,color: Colors.yellow,fontWeight: FontWeight.bold),),
                  ),
                ),
                Container(
                  height: 160,width: 160,
                  child: Transform(alignment: Alignment.center,transform: Matrix4.rotationX(3.141),
                      child: Image(image: AssetImage(li[y]),fit: BoxFit.cover,)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Container(
                          height: 50,width: 250,
                          color: Colors.yellow,
                          child: Center(child: Text(win,style: TextStyle(fontSize: 30,color: Colors.black,fontWeight: FontWeight.bold),)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: InkWell(onTap: (){
                          x=0;
                          y=0;
                          win='Start';
                          y1=0;
                          c1=0;
                          _contorller.stop();
                          setState(() {

                          });
                        },
                            child: Icon(Icons.refresh,size: 60,color: Colors.yellow,)),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 150,top: 20),
                  child: Container(
                    height: 50,width: 200,
                    child: Text('You',style: TextStyle(fontSize: 30,color: Colors.yellow,fontWeight: FontWeight.bold),),
                  ),
                ),
                Container(
                  height: 160,width: 160,
                  child: Image(image: AssetImage(li[x]),fit: BoxFit.cover,),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 40,right: 20),
                        child: Container(
                            height: 75,width: 75,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,color: Colors.grey
                            ),
                            child: InkWell(onTap: (){
                              x=1;
                              y=fun(y);
                              print(y);
                              if (x==y) win='Draw';
                              else if( (x==1 && y==3)
                              || (x==2 && y==1) || (x==3&&y==2)) {
                              win='You win';
                              y1++;
                              }
                              else {
                              win = 'Computer wins';
                              c1++;
                              }
                              if(y1==3){
                                _contorller.play();
                              }
                              else if(c1==3){
                                win='You lose!';
                              }
                              setState(() {

                              });
                            },
                                child: Center(child: Text('👊',style: TextStyle(fontSize: 50,color: Colors.yellow),)))
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Container(
                            height:75,width: 75,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,color: Colors.grey
                            ),
                            child: InkWell(onTap: (){
                              x=2;
                              y=fun(y);
                              if (x==y) win='Draw';
                              else if( (x==1 && y==3)
                                  || (x==2 && y==1) || (x==3&&y==2)) {
                                win='You win';
                                y1++;
                              }
                              else {
                                win = 'Computer wins';
                                c1++;
                              }
                              if(y1==3){
                                _contorller.play();
                              }
                              else if(c1==3){
                                win='You lose!';
                              }
                              setState(() {

                              });
                            },

                                child: Center(child: Text('✋',style: TextStyle(fontSize: 50,color: Colors.yellow),)))
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: InkWell(onTap: (){
                          x=3;
                          y=fun(y);
                          if (x==y) win='Draw';
                          else if( (x==1 && y==3)
                          || (x==2 && y==1) || (x==3&&y==2)) {
                            win='You win';
                            y1++;
                          }
                          else {
                            win = 'Computer wins';
                            c1++;
                          }
                          if(y1==3){
                            _contorller.play();
                          }
                          else if(c1==3){
                            win='You lose!';
                          }
                          setState(() {

                          });
                        },
                          child: Container(
                              height: 75,width: 75,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,color: Colors.grey
                              ),
                              child: Center(child: Text('✌',style: TextStyle(fontSize: 50,color: Colors.yellow),))
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

        ),
          ConfettiWidget(
              confettiController: _contorller,
            blastDirection: pi/2,
            colors: [
              Colors.deepPurple,
              Colors.white,
              Colors.yellow
            ],
            gravity: 0.01,
          )
    ],
      ),
    );
  }
}
