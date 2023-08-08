import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InspirationPage extends StatelessWidget {
  const InspirationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: const SafeArea(
        child: Column(
          children: [
            Header(),
            DesignList(),
            SizedBox(
              height: 20,
            ),
            SpecialItem(),
          ],
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 300,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1527980965255-d3b416303d12?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8YXZhdGFyfGVufDB8fDB8fHww&auto=format&fit=crop&w=600&q=60'),
                      radius: 40,
                    ),
                    Spacer(),
                    Icon(Icons.menu)
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Good Morning',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const Text(
                  'Barry Allen',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search your favorite designs here',
                    prefixIcon: const Icon(Icons.search_rounded),
                    filled: true,
                    fillColor: Colors.grey[100],
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          20,
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    color: Colors.black,
                    height: 3,
                    width: 45,
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
          top: 10,
          right: 60,
          child: SvgPicture.asset(
            'assets/images/sun.svg',
            height: 160,
          ),
        ),
        Positioned(
          top: 80,
          right: 30,
          child: SvgPicture.asset(
            'assets/images/cloud.svg',
            height: 80,
          ),
        )
      ],
    );
  }
}

class DesignList extends StatelessWidget {
  const DesignList({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, String> mockData = {
      "Romi ":
          "https://images.unsplash.com/photo-1549887344-98d744ff55c5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8ZGVzaWduc3xlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60",
      "Devin":
          "https://images.unsplash.com/photo-1603703985186-bec0cad49fb7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fGRlc2lnbnN8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=600&q=60",
      "Harry":
          "https://images.unsplash.com/photo-1617791116959-f09c8987a947?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fGRlc2lnbnN8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=600&q=60",
      "Potter":
          "https://images.unsplash.com/photo-1560005360-f5df6037001a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fGRlc2lnbnN8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=600&q=60",
      "Albert":
          "https://images.unsplash.com/photo-1458322493962-69c5a4ef7ddf?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8ZGVzaWduc3xlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60",
      "Tony":
          "https://plus.unsplash.com/premium_photo-1675747693477-53d0082356c8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fHBhdHRlcm58ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=600&q=60",
    };
    return SizedBox(
      height: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 6),
            child: Text(
              'This weeks special',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                for (MapEntry<String, String> item in mockData.entries) SpecialImage(name: item.key, image: item.value),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SpecialImage extends StatelessWidget {
  const SpecialImage({super.key, required this.name, required this.image});
  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.5 / 3,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(image),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [0.2, 0.8],
              colors: [Colors.black.withOpacity(0.1), Colors.black.withOpacity(0.7)],
            ),
          ),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SpecialItem extends StatelessWidget {
  const SpecialItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
              'https://plus.unsplash.com/premium_photo-1673795754005-214e3e1fccba?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fHBhdHRlcm58ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=600&q=60'),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.2, 0.8],
            colors: [Colors.black.withOpacity(0.1), Colors.black.withOpacity(0.7)],
          ),
        ),
        child: const Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Larry Russo',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
