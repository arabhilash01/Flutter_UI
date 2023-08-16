import 'package:flutter/material.dart';

class Rhythm extends StatefulWidget {
  const Rhythm({super.key});

  @override
  State<Rhythm> createState() => _RhythmState();
}

class _RhythmState extends State<Rhythm> {
  int selectedIndex = 0;
  List<Widget> tabs = [
    const RhythmHome(),
    const MusicLibrary(),
    const MusicPlayer(),
    const UserProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: tabs[selectedIndex],
      bottomNavigationBar: RhythmCustomBottomNavBar(
        onChangeIndex: _onChangeIndex,
        selectedIndex: selectedIndex,
      ),
    );
  }

  void _onChangeIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}

class RhythmHome extends StatelessWidget {
  const RhythmHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          RhythmHomeHeader(),
          Suggestions(),
          PopularHits(),
        ],
      ),
    );
  }
}

class RhythmHomeHeader extends StatelessWidget {
  const RhythmHomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: 15,
              ),
              // Spacer(),
              Text(
                'Discover',
                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9WIyDQ1KhiN5FFd3jcHZ1IzjYpC-OFdl7AXH6lFmMsJKK4Y476a_Kr4rxe4iI8kv4pywX&s'),
              ),
              SizedBox(
                width: 10,
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.grey[900]!, Colors.black]),
                borderRadius: BorderRadius.circular(10)),
            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey[700]!,
                  ),
                  hintText: 'Search..',
                  hintStyle: TextStyle(color: Colors.grey[700]!)),
            ),
          )
        ],
      ),
    );
  }
}

class Suggestions extends StatelessWidget {
  const Suggestions({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> suggestionsData = [
      {
        "name": "Morning Mix",
        "poster": "https://i.pinimg.com/originals/d0/a6/b7/d0a6b79e923ff8544291ba58ce4a1cb0.jpg",
      },
      {
        "name": "Electric Mix",
        "poster": "https://i.pinimg.com/564x/02/e4/8c/02e48cb48385aee250483fa376758022.jpg",
      },
      {
        "name": "Chill Music",
        "poster":
            "https://marketplace.canva.com/EAFSNmv0C0k/1/0/1600w/canva-orange-illustration-relaxing-playlist-cover-G1lOYn2PS28.jpg",
      },
      {
        "name": "Gym Motivation",
        "poster":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0Y5mNNPSravVGc6MOxLEsN98HPpuDE-L5gPaHA6EKcw&s",
      },
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Text(
            'Perfect for you',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: suggestionsData.length,
            itemBuilder: (context, index) => MusicCard(
              cardHeight: 150,
              cardWidth: 180,
              posterImage: suggestionsData[index]['poster'] as String,
              songName: suggestionsData[index]['name'] as String,
              artistName: '',
            ),
          ),
        ),
        SizedBox(
          height: 240,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: suggestionsData.length,
              itemBuilder: (context, index) => const Suggestioncard(name: 'FLY THE FALCON')),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

class PopularHits extends StatelessWidget {
  const PopularHits({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> songsData = [
      {
        "song": "What do you mean",
        "artist": "Justin Bieber",
        "poster":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdd8nQYTI755gt4Ui693JLrYf5T1FfSGaXRvm7mg8jyw&s",
      },
      {
        "song": "Ghost",
        "artist": "Ella Henderson",
        "poster":
            "https://upload.wikimedia.org/wikipedia/en/e/ee/Ella_Henderson_-_Ghost_%28Official_Single_Cover%29.png",
      },
      {
        "song": "End Game",
        "artist": "Taylor Swift",
        "poster": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiFcZmV11vYDsPtO_tNMFYqFDWihk51IoBudH7_6I1&s",
      },
      {
        "song": "Paris",
        "artist": "The Chainsmokers",
        "poster":
            "https://static.displate.com/280x392/displate/2021-07-29/36f8c01c6d1c71df9a60daba0e9d70b4_d8c7b0469db87ee96fc6e59fc5d6c7ff.jpg",
      },
    ];
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            children: [
              const Text(
                'April popular Hits',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              const Spacer(),
              Text(
                'See all',
                style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 15),
              ),
              const SizedBox(
                width: 5,
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.white.withOpacity(0.5),
                size: 15,
              )
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: songsData.length,
            itemBuilder: (context, index) => MusicCard(
                titlesize: 14,
                cardHeight: 140,
                cardWidth: 130,
                posterImage: songsData[index]['poster'] as String,
                songName: songsData[index]['song'] as String,
                artistName: songsData[index]['artist'] as String),
          ),
        )
      ],
    );
  }
}

class Suggestioncard extends StatelessWidget {
  const Suggestioncard({super.key, this.color, this.image, required this.name});
  final String? image;
  final String name;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Stack(
        children: [
          const SizedBox(
            width: 300,
            height: 200,
          ),
          Positioned(
            top: 15,
            child: Container(
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: color ?? Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const SizedBox(
                width: 300,
                height: 200,
              ),
            ),
          ),
          Positioned(
            right: -37,
            bottom: 0,
            top: -10,
            child: Image.asset(
              'assets/images/music_card.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            width: 180,
            top: 30,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style:
                      const TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.w900, letterSpacing: 2),
                ),
                const Text(
                  'Discover 87 songs!',
                  style: TextStyle(color: Colors.black26, fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 40),
                const Icon(Icons.arrow_forward_ios_rounded),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MusicLibrary extends StatelessWidget {
  const MusicLibrary({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RhythmHeader(),
            FollowedArtists(),
            RecentlyPlayed(),
            TopDailyPlaylist(),
          ],
        ),
      ),
    );
  }
}

class RhythmHeader extends StatelessWidget {
  const RhythmHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Good Evening',
            style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          CircleAvatar(
            backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1527980965255-d3b416303d12?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8YXZhdGFyfGVufDB8fDB8fHww&auto=format&fit=crop&w=600&q=60'),
            radius: 30,
          ),
        ],
      ),
    );
  }
}

class FollowedArtists extends StatelessWidget {
  const FollowedArtists({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, String?> artistList = {
      "Calum Scott":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPf-K7ss2WcvLflqrYzh_JYLTPyovVfs8wq_MZxf6eeZBl6j5kt676BDD6kAvCcvQB5PI&usqp=CAU",
      "Katty Perry":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9WIyDQ1KhiN5FFd3jcHZ1IzjYpC-OFdl7AXH6lFmMsJKK4Y476a_Kr4rxe4iI8kv4pywX&s",
      "Blake Shelton":
          "https://yt3.googleusercontent.com/PPWF95hi5RL-PxcJ5Ute9RwzkdqoZhETJed0XaUnC_YCcfIUiYMURUxojQMZijgr6EppiGJi=s900-c-k-c0x00ffffff-no-rj",
      "Ava Max": null,
    };

    return SizedBox(
      height: 170,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              'Followed Artist',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: artistList.length,
              itemBuilder: (context, index) {
                final artistName = artistList.keys.elementAt(index);
                final artistImage = artistList[artistName];
                return Container(
                  width: 95,
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(artistImage ??
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTC-iru3Q9rp0uCPHfvg5Sq44UqZnCRGROpdLJGUUpcnw&s'),
                        radius: 40,
                      ),
                      Text(artistName, style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 15))
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}

class RecentlyPlayed extends StatelessWidget {
  const RecentlyPlayed({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> recentlyPlayedData = [
      {
        "song": "Paris",
        "artist": "The Chainsmokers",
        "poster":
            "https://static.displate.com/280x392/displate/2021-07-29/36f8c01c6d1c71df9a60daba0e9d70b4_d8c7b0469db87ee96fc6e59fc5d6c7ff.jpg",
      },
      {
        "song": "Ghost",
        "artist": "Ella Henderson",
        "poster":
            "https://upload.wikimedia.org/wikipedia/en/e/ee/Ella_Henderson_-_Ghost_%28Official_Single_Cover%29.png",
      },
      {
        "song": "End Game",
        "artist": "Taylor Swift",
        "poster": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiFcZmV11vYDsPtO_tNMFYqFDWihk51IoBudH7_6I1&s",
      },
      {
        "song": "What do you mean",
        "artist": "Justin Bieber",
        "poster":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdd8nQYTI755gt4Ui693JLrYf5T1FfSGaXRvm7mg8jyw&s",
      },
    ];
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            children: [
              const Text(
                'Recently Played',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              const Spacer(),
              Text(
                'See all',
                style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 15),
              ),
              const SizedBox(
                width: 5,
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.white.withOpacity(0.5),
                size: 15,
              )
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          height: 325,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: recentlyPlayedData.length,
            itemBuilder: (context, index) => MusicCard(
                posterImage: recentlyPlayedData[index]['poster'] as String,
                songName: recentlyPlayedData[index]['song'] as String,
                artistName: recentlyPlayedData[index]['artist'] as String),
          ),
        )
      ],
    );
  }
}

class TopDailyPlaylist extends StatelessWidget {
  const TopDailyPlaylist({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> playlistData = [
      {
        "owner": "Unwrap",
        "name": "Good Morning",
        "image": "https://i.pinimg.com/originals/d0/a6/b7/d0a6b79e923ff8544291ba58ce4a1cb0.jpg",
        "count": "74",
      },
      {
        "owner": "Ritwiz",
        "name": "Electric mix",
        "image": "https://i.pinimg.com/564x/02/e4/8c/02e48cb48385aee250483fa376758022.jpg",
        "count": "12",
      },
      {
        "owner": "Gravero",
        "name": "Chill Music",
        "image":
            "https://marketplace.canva.com/EAFSNmv0C0k/1/0/1600w/canva-orange-illustration-relaxing-playlist-cover-G1lOYn2PS28.jpg",
        "count": "30",
      },
      {
        "owner": "AbcMusic",
        "name": "Gym Motivation",
        "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0Y5mNNPSravVGc6MOxLEsN98HPpuDE-L5gPaHA6EKcw&s",
        "count": "80",
      }
    ];
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              const Text(
                'Top Daily Playlists',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              const Spacer(),
              Text(
                'See all',
                style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 15),
              ),
              const SizedBox(
                width: 5,
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.white.withOpacity(0.5),
                size: 15,
              )
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        for (Map<String, String> item in playlistData)
          PlaylistCard(
            owner: item['owner'] as String,
            playListName: item['name'] as String,
            posterImage: item['image'] as String,
            songCount: item['count'] as String,
          ),
      ],
    );
  }
}

class MusicCard extends StatelessWidget {
  const MusicCard({
    super.key,
    required this.posterImage,
    required this.songName,
    required this.artistName,
    this.cardWidth,
    this.cardHeight,
    this.titlesize,
  });
  final String posterImage;
  final String songName;
  final String artistName;
  final double? cardWidth;
  final double? cardHeight;
  final double? titlesize;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.blue,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(posterImage),
            ),
          ),
          child: SizedBox(
            width: cardWidth ?? 200,
            height: cardHeight ?? 230,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                songName,
                style: TextStyle(color: Colors.white, fontSize: titlesize ?? 20),
              ),
              Text(
                artistName,
                style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: titlesize ?? 17),
              )
            ],
          ),
        )
      ],
    );
  }
}

class PlaylistCard extends StatelessWidget {
  const PlaylistCard({
    super.key,
    required this.playListName,
    required this.owner,
    required this.songCount,
    required this.posterImage,
  });
  final String playListName;
  final String owner;
  final String songCount;
  final String posterImage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(posterImage),
            ),
          ),
          child: const SizedBox(
            width: 70,
            height: 50,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              playListName,
              style: const TextStyle(color: Colors.white, fontSize: 17),
            ),
            Text(
              'By $owner . $songCount Songs',
              style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 17),
            ),
          ],
        )
      ],
    );
  }
}

class RhythmCustomBottomNavBar extends StatelessWidget {
  const RhythmCustomBottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onChangeIndex,
  }) : super(key: key);

  final int selectedIndex;
  final Function(int) onChangeIndex;

  static const List<IconData> _icons = [
    Icons.home,
    Icons.library_books_rounded,
    Icons.music_note_outlined,
    Icons.settings,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          for (int index = 0; index < _icons.length; index++)
            GestureDetector(
              onTap: () => onChangeIndex(index),
              child: AnimatedScale(
                curve: Curves.easeIn,
                duration: const Duration(milliseconds: 500),
                scale: selectedIndex == index ? 1.25 : 1,
                child: Icon(
                  _icons[index],
                  color: selectedIndex == index ? Colors.green : Colors.white,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class MusicPlayer extends StatelessWidget {
  const MusicPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RotatedBox(
                  quarterTurns: 45,
                  child: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.white.withOpacity(0.7),
                    size: 20,
                  ),
                ),
                const Text(
                  'Chill Collection',
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
                Icon(
                  Icons.donut_small_sharp,
                  color: Colors.white.withOpacity(0.7),
                  size: 20,
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: NetworkImage('https://i.scdn.co/image/ab67616d0000b273bfedccaca3c8425fdc0a7c73'),
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const SizedBox(
              width: 350,
              height: 350,
            ),
          ),
          const Text(
            'How do i say goodbye',
            style: TextStyle(color: Colors.white, fontSize: 27, fontWeight: FontWeight.w600),
          ),
          Text(
            'Dean Lewis',
            style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 17, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Stack(
            alignment: Alignment.centerLeft,
            children: [
              Container(
                height: 4.5,
                width: 340,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white.withOpacity(0.7),
                ),
              ),
              Container(
                height: 5,
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '2:53',
                  style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 15, fontWeight: FontWeight.w600),
                ),
                Text(
                  '-1:34',
                  style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          RichText(
            text: TextSpan(
                text: 'Next : ',
                style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 15, fontWeight: FontWeight.w600),
                children: const [
                  TextSpan(
                      text: 'Shake it Off (Taylor Swift)',
                      style: TextStyle(color: Colors.green, fontSize: 15, fontWeight: FontWeight.w600))
                ]),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.favorite_border,
                  color: Colors.white.withOpacity(0.7),
                ),
                Icon(
                  Icons.arrow_back_ios_sharp,
                  color: Colors.white.withOpacity(0.9),
                  size: 40,
                ),
                const Icon(
                  Icons.play_circle_filled_rounded,
                  color: Colors.white,
                  size: 70,
                ),
                Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: Colors.white.withOpacity(0.9),
                  size: 40,
                ),
                Icon(
                  Icons.share,
                  color: Colors.white.withOpacity(0.7),
                )
              ],
            ),
          ),
          Column(
            children: [
              Text(
                'Lyrics',
                style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 20, fontWeight: FontWeight.w600),
              ),
              RotatedBox(
                quarterTurns: 45,
                child: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.white.withOpacity(0.7),
                  size: 20,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                Text(
                  'Profile',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Icon(
                  Icons.view_compact_sharp,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const CircleAvatar(
            radius: 60,
            backgroundImage: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9WIyDQ1KhiN5FFd3jcHZ1IzjYpC-OFdl7AXH6lFmMsJKK4Y476a_Kr4rxe4iI8kv4pywX&s'),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Katty Perry',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white38),
            ),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Edit Profile',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 2,
            width: double.infinity,
            color: Colors.white12,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      '742',
                      style: TextStyle(
                        color: Colors.white30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Fav Song',
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '17.8M',
                      style: TextStyle(
                        color: Colors.white30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Followers',
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '2.6k',
                      style: TextStyle(
                        color: Colors.white30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Following',
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 2,
            width: double.infinity,
            color: Colors.white12,
          )
        ],
      ),
    );
  }
}
