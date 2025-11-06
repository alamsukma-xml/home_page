import 'package:flutter/material.dart';

const Color kPrimaryColor = Color.fromARGB(255, 207, 169, 0); 
const Color kSecondaryGreen = Color(0xFF6DE899);
const Color kLightBackground = Color.fromARGB(255, 253, 253, 253); 


class HomePage extends StatelessWidget {
  final String creatorName = 'Alam Sukma Sejati';
  final String creatorNIM = '232101152';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 243, 243), 
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(),
                  const SizedBox(height: 20),

                  const Text(
                    'Good morning,',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: Colors.black87,
                    ),
                  ),
                  const Text(
                    'Mr. Alam Sukma',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w800,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 24),

                  _buildSearchBar(),
                  const SizedBox(height: 24),

                  _buildCategoryTabs(),
                  const SizedBox(height: 24),

                  _buildIconCategories(),
                  const SizedBox(height: 32),

                  _buildContentGrid(),
                  
                  const SizedBox(height: 40),
                  _buildCreatorInfo(),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),

          _buildBottomNavBar(context),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ClipOval(
          child: SizedBox( 
            width: 50,
            height: 50,
            child: Image.asset(
              'assets/images/profil.jpg',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  child: const Center(child: Icon(Icons.person, color: Colors.grey)),
                );
              },
            ),
          ),
        ),
        const Icon(Icons.menu, color: Colors.black54, size: 30),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: kLightBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: TextStyle(color: Colors.grey),
          prefixIcon: Icon(Icons.search, color: Color.fromARGB(255, 158, 158, 158)),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 14),
        ),
      ),
    );
  }

  Widget _buildCategoryTabs() {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _CategoryTab(text: 'For you', isActive: true),
          _CategoryTab(text: 'Relationships', isActive: false),
          _CategoryTab(text: 'Parenting', isActive: false),
          _CategoryTab(text: 'Stress', isActive: false),
          _CategoryTab(text: 'Therapy', isActive: false),
        ],
      ),
    );
  }

  Widget _buildIconCategories() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _CategoryChip(
          icon: Icons.star_border,
          label: 'Career motivation',
        ),
        _CategoryChip(
          icon: Icons.home_outlined,
          label: 'Relationship with parents',
        ),
      ],
    );
  }

  Widget _buildContentGrid() {
    return GridView.count(
      shrinkWrap: true, 
      physics: const NeverScrollableScrollPhysics(), 
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 0.95, 
      children: const [
        _ContentGridItem(
          title: 'About a panic attack',
          subtitle: 'How does it nourish itself',
          imagePath: 'assets/images/bg.jpg', 
        ),
        _ContentGridItem(
          title: 'What to do if the future scares',
          subtitle: 'The four-screen method',
          imagePath: 'assets/images/bk.jpg', 
        ),
      ],
    );
  }

  Widget _buildCreatorInfo() {
    return Center(
      child: Text(
        'UI/UX by $creatorName (NIM: $creatorNIM)',
        style: const TextStyle(
          fontSize: 10,
          color: Colors.black,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    return Container(
      height: 70, 
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      padding: const EdgeInsets.only(bottom: 10.0),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavBarItem(icon: Icons.home, isActive: true),
          _NavBarItem(icon: Icons.chat_bubble_outline),
          _NavBarItem(icon: Icons.calendar_today_outlined),
          _NavBarItem(icon: Icons.person_outline),
        ],
      ),
    );
  }
}

class _CategoryTab extends StatelessWidget {
  final String text;
  final bool isActive;

  const _CategoryTab({super.key, required this.text, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isActive ? kPrimaryColor : kLightBackground,
        borderRadius: BorderRadius.circular(20),
        border: isActive ? null : Border.all(color: Colors.grey.shade300),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isActive ? Colors.black : Colors.black54, 
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _CategoryChip({super.key, required this.icon, required this.label}); 

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 87, 87, 87).withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row( 
        mainAxisSize: MainAxisSize.min, 
        children: [
          Icon(icon, color: const Color.fromARGB(255, 220, 184, 0), size: 24), 
          const SizedBox(width: 8),
          Text(
            label, 
            style: const TextStyle(
              fontSize: 14,
              color: Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}


class _ContentGridItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;

  const _ContentGridItem({
    super.key, 
    required this.title,
    required this.subtitle,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(71, 76, 142, 0), 
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imagePath,
              height: 70,
              width: double.infinity,
              fit: BoxFit.cover, 
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 70,
                  color: Colors.grey[300],
                  child: const Center(child: Text("Image Not Found", style: TextStyle(fontSize: 10))),
                );
              },
            ),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 12,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ],
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final IconData icon;
  final bool isActive;

  const _NavBarItem({required this.icon, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: isActive ? const Color.fromARGB(255, 216, 180, 0) : Colors.grey,
      size: 30,
    );
  }
}