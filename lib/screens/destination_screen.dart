import 'package:flutter/material.dart';
import 'package:flutter_travel_ui_starter/models/destination_model.dart';
import 'package:flutter_travel_ui_starter/models/activity_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DestinationScreen extends StatefulWidget {
  final Destination destination;

  DestinationScreen({this.destination});
  @override
  _DestinationScreenState createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  Text _buildRatingStars(int rating) {
    String stars = "";
    for (int i = 0; i < rating; i++) {
      stars += "⭐ ";
    }
    stars.trim();
    return Text(stars);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0.0, 2.0),
                          blurRadius: 6.0)
                    ]),
                child: Hero(
                  tag: widget.destination.imageUrl,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image(
                      image: AssetImage(widget.destination.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () => Navigator.pop(context)),
                    Row(
                      children: [
                        IconButton(
                            icon: Icon(Icons.search),
                            onPressed: () => Navigator.pop(context)),
                        IconButton(
                            icon: Icon(FontAwesomeIcons.sortAmountDown),
                            onPressed: () => Navigator.pop(context))
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                  left: 20,
                  bottom: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.destination.city,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2),
                      ),
                      Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.locationArrow,
                            size: 15,
                            color: Colors.white70,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            widget.destination.country,
                            style:
                                TextStyle(color: Colors.white70, fontSize: 20),
                          )
                        ],
                      )
                    ],
                  )),
              Positioned(
                  right: 20,
                  bottom: 20,
                  child: Icon(
                    Icons.location_on,
                    color: Colors.white70,
                    size: 25,
                  ))
            ],
          ),
          Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  itemCount: widget.destination.activities.length,
                  itemBuilder: (BuildContext context, int index) {
                    Activity activity = widget.destination.activities[index];
                    return Stack(
                      children: [
                        Text("I will continue soon"),
                        Text("be a man")
                      ],
                    );
                  }))
        ],
      ),
    );
  }
}
