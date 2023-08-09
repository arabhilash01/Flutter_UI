import 'dart:ui';

import 'package:flutter/material.dart';

class Wanderer extends StatelessWidget {
  const Wanderer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            HeaderSection(),
            CategorySection(),
            RecommendedPlaces(),
          ],
        ),
      ),
    );
  }
}

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 5.0),
      child: SizedBox(
        height: 50,
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Where do you wanna go?',
            hintStyle: TextStyle(color: Colors.grey[500]),
            prefixIcon: Icon(
              Icons.search_sharp,
              color: Colors.black.withOpacity(0.6),
            ),
            suffixIcon: Icon(
              Icons.format_align_left_sharp,
              color: Colors.black.withOpacity(0.6),
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(40),
            ),
          ),
        ),
      ),
    );
  }
}

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 7,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(7.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey[500]!),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.hotel,
                  color: Colors.grey[800],
                ),
                const SizedBox(width: 3),
                const Text(
                  'Hotel',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class RecommendedPlaces extends StatelessWidget {
  const RecommendedPlaces({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> locations = [
      {
        "name": "Hokkaido Ramen Santouka",
        "location": "Hokkaido",
        "distance": "800",
        "rating": "4.5",
        "image":
            "https://images.unsplash.com/photo-1617421753170-46511a8d73fc?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8UmFtZW58ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=600&q=60"
      },
      {
        "name": "Club De Ruas Resort",
        "location": "California",
        "distance": "900",
        "rating": "4.8",
        "image":
            "https://images.unsplash.com/photo-1606046604972-77cc76aee944?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8aG90ZWxzfGVufDB8fDB8fHww&auto=format&fit=crop&w=600&q=60"
      },
      {
        "name": "De Paul Mini Restraunt",
        "location": "St.Peter Street",
        "distance": "300",
        "rating": "4.9",
        "image":
            "https://images.unsplash.com/photo-1505826759037-406b40feb4cd?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cmVzdHJhdXJhbnR8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=600&q=60"
      },
    ];
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(7.0),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  'Recommended Places',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  'See All',
                  style: TextStyle(color: Colors.grey[500]),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: locations.length,
                itemBuilder: (context, index) {
                  return LocationCards(
                    fromDistance: locations[index]["distance"]!,
                    location: locations[index]["location"]!,
                    placeName: locations[index]["name"]!,
                    ratings: locations[index]["rating"]!,
                    image: locations[index]["image"]!,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LocationCards extends StatelessWidget {
  const LocationCards({
    super.key,
    required this.placeName,
    required this.location,
    required this.fromDistance,
    required this.ratings,
    required this.image,
  });
  final String placeName;
  final String location;
  final String fromDistance;
  final String ratings;
  final String image;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          height: 380,
          width: constraints.maxWidth * 0.6,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(image),
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [Colors.black.withOpacity(0.2), Colors.black.withOpacity(0.7)],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    BlurredContainer(
                      width: 200,
                      height: 55,
                      margin: const EdgeInsets.all(18),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white, // Background color
                                borderRadius: BorderRadius.circular(24), // Optional: Add rounded corners
                              ),
                              padding: const EdgeInsets.all(5),
                              child: Icon(
                                Icons.wallet_travel_sharp,
                                size: 30,
                                color: Colors.black.withOpacity(0.7), // Icon color
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "$fromDistance  Meters",
                                style: const TextStyle(color: Colors.white, fontSize: 20),
                              ),
                              Text(
                                "From your Location",
                                style: TextStyle(color: Colors.white.withOpacity(0.6)),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const Spacer(),
                    BlurredContainer(
                        width: 40,
                        height: 40,
                        margin: const EdgeInsets.all(20),
                        child: Icon(
                          Icons.favorite_border_outlined,
                          color: Colors.white.withOpacity(0.6),
                        ))
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: SizedBox(
                            width: constraints.maxWidth * 0.7,
                            child: Column(
                              children: [
                                Text(
                                  placeName,
                                  style: const TextStyle(color: Colors.white, fontSize: 30),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: Colors.white.withOpacity(0.6),
                                      size: 15,
                                    ),
                                    Text(
                                      "$location .",
                                      style: TextStyle(color: Colors.white.withOpacity(0.6)),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Icon(
                                      Icons.star_border,
                                      color: Colors.white.withOpacity(0.6),
                                      size: 17,
                                    ),
                                    Text(
                                      "$ratings ratings",
                                      style: TextStyle(color: Colors.white.withOpacity(0.6)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Transform.rotate(
                              angle: -90 / 2,
                              child: Icon(
                                Icons.arrow_forward_sharp,
                                color: Colors.black.withOpacity(0.6),
                              )),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class BlurredContainer extends StatelessWidget {
  const BlurredContainer({super.key, required this.width, required this.height, required this.child, this.margin});
  final double width;
  final double height;
  final Widget child;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.all(0),
      width: width,
      height: height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: BackdropFilter(filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0), child: child),
      ),
    );
  }
}
