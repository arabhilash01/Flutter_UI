import 'package:flutter/material.dart';

class Rhythm extends StatelessWidget {
  const Rhythm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black54,
      body: SafeArea(
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
  });
  final String posterImage;
  final String songName;
  final String artistName;

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
          child: const SizedBox(
            width: 200,
            height: 230,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                songName,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
              Text(
                artistName,
                style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 17),
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
