import 'package:flutter/material.dart';
import 'package:travel_blogger/pages/responsive.dart';
import 'package:travel_blogger/widgets/trip_card.dart';

class GalleryPages extends StatelessWidget {
  GalleryPages({super.key});

  final List<Map<String, String>> galleryItems = [
    {
      'image': 'assets/places/italy.jpeg',
      'flag': 'assets/places/italyflag.jpeg',
    },
    {
      'image': 'assets/places/germany.jpg',
      'flag': 'assets/places/germany.png',
    },
    {
      'image': 'assets/places/turkey.jpeg',
      'flag': 'assets/places/turkeyflag.png',
    },
    {
      'image': 'assets/places/norway.jpeg',
      'flag': 'assets/places/norwayflag.jpg',
    },
    {
      'image': 'assets/places/usaplace.jpeg',
      'flag': 'assets/places/usa.jpeg',
    },
    {
      'image': 'assets/places/uk.jpg',
      'flag': 'assets/places/usa.jpeg',
    },
  ];

  final List<Map<String, String>> recentTrips = [
    {'image': 'assets/places/dubainight.jpeg', 'title': 'Dubai'},
    {'image': 'assets/places/andmaan.jpg', 'title': 'Andmaan'},
    {'image': 'assets/places/switzerland.jpeg', 'title': 'Switzerland'},
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10,),
          Text(
            'Gallery',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: galleryItems.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
              final item = galleryItems[index];
              return ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        item['image']!,
                        fit: BoxFit.cover,

                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 10,
                      child: Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            item['flag']!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          SizedBox(height: 24),
          Text(
            'Recent Trips',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 12),
          SizedBox(
            height: getHeight(context) * 0.1,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: recentTrips.length,
              separatorBuilder: (context, index) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                final trip = recentTrips[index];
                return trip_card(
                  title: '${trip['title']}', image: '${trip['image']}',);
              },
            ),
          ),
           SizedBox(height: 16),
           Center(
            child: Text(
              '"Travel makes one modest. You see what a tiny place you occupy in the world."',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
