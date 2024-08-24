import 'package:demoproject/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> _locations = ["London", "NewYork", "Japan", "Poland"];
  int _actvelocation = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      left: false,
      top: true,
      bottom: true,
      right: false,
      minimum: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.05, 0,
          MediaQuery.of(context).size.width * 0.05, 0),
      child: _mainColumn(context),
    ));
  }

  Widget _mainColumn(_context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.menu,
              color: Colors.black,
              size: 35,
            ),
            Container(
              height: 39,
              width: 144,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/logo_discover.png'))),
            ),
            Icon(
              Icons.search,
              color: Colors.black,
              size: 35,
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.03,
              bottom: MediaQuery.of(context).size.height * 0.03),
          child: _locationsbar(_context),
        ),
        _articlelist(_context),
      ],
    );
  }

  Widget _locationsbar(BuildContext _context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.065,
      decoration: BoxDecoration(
          color: Color.fromRGBO(69, 69, 69, 1),
          borderRadius: BorderRadius.circular(50)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _locations.map((l) {
          bool _isActive = _locations[_actvelocation] == l ? true : false;
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                l,
                style: TextStyle(
                    fontSize: 15,
                    color: _isActive ? Colors.white : Colors.white54,
                    fontFamily: 'Montserrat'),
              ),
              _isActive
                  ? Container(
                      width: 40,
                      height: 5,
                      decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(20)))
                  : Container(),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _articlelist(BuildContext _context) {
    return Expanded(
      child: ListView.builder(
          itemCount: articles.length,
          itemBuilder: (context, index) {
            return Stack(
              clipBehavior: Clip.none,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height * 0.05),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.35,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(articles[index].image),
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black45,
                                blurRadius: 20,
                                spreadRadius: 2,
                                offset: Offset(0, 6))
                          ]),
                      child: _articleinfoColumn(_context, index),
                    ),
                  ),
                ),
                Positioned(
                    bottom: 10,
                    left: MediaQuery.of(context).size.width * 0.10,
                    child: _socialInfoContainer(_context, index))
              ],
            );
          }),
    );
  }

  Widget _articleinfoColumn(BuildContext _context, int _index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 30, 0),
          child: _authourinfoRow(_context, _index),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(
              30, MediaQuery.of(_context).size.height * 0.05, 30, 0),
          child: _detailInfoRow(_context, _index),
        ),
      ],
    );
  }

  Widget _authourinfoRow(BuildContext _context, int _index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://i.pravatar.cc/300"),
                  ),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 4)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    articles[_index].author,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '3 Hours Ago',
                    style: TextStyle(
                        color: Colors.white54,
                        fontSize: 13,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            )
          ],
        ),
        Column(
          children: [
            Icon(
              Icons.favorite,
              color: Colors.red,
              size: 20,
            ),
            SizedBox(
              height: 5,
            ),
            Icon(
              Icons.bookmark,
              color: Colors.white,
              size: 20,
            )
          ],
        )
      ],
    );
  }

  Widget _detailInfoRow(BuildContext _context, int _index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        FloatingActionButton(
          onPressed: () {},
          shape: const CircleBorder(),
          backgroundColor: Colors.white,
          child: Icon(
            Icons.play_arrow,
            color: Colors.redAccent,
            size: 30,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.50,
                child: Text(
                  articles[_index].title,
                  maxLines: 3,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                articles[_index].location,
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: 13,
                    fontWeight: FontWeight.w700),
              ),
              _ratingWidget(_context, _index),
            ],
          ),
        )
      ],
    );
  }

  Widget _socialInfoContainer(BuildContext _context, int _index) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width * 0.70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            children: [
              Icon(
                Icons.favorite_border,
                color: Colors.redAccent,
              ),
              Text(
                articles[_index].likes.toString(),
                style: TextStyle(color: Colors.redAccent),
              )
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.mode_comment,
                color: Colors.grey,
              ),
              Text(
                articles[_index].comments.toString(),
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.share,
                color: Colors.grey,
              ),
              Text(
                articles[_index].shares.toString(),
                style: TextStyle(color: Colors.grey),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _ratingWidget(BuildContext _context, int _index) {
    return Row(
      children: List.generate(5, (_currentIndex) {
        double _fillAmount = articles[_index].rating - _currentIndex;
        Icon _starIcon;
        if (_fillAmount >= 1) {
          _starIcon = Icon(
            Icons.star,
            color: Colors.amberAccent,
            size: 15,
          );
        } else if (_fillAmount >= 0.5) {
          _starIcon = Icon(
            Icons.star_half,
            color: Colors.amberAccent,
            size: 15,
          );
        } else {
          _starIcon = Icon(
            Icons.star_border,
            color: Colors.amberAccent,
            size: 15,
          );
        }
        return _starIcon;
      }),
    );
  }
}
