import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hubtel_coding_challenge/components/user_cards.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isHistorySelected = true; // Track which option is selected

  int _selectedIndex = 0; // Add this line to manage the active tab index
  bool _isLoading = true; // Step 1: Add a state variable for loading state

  // Method to handle navigation bar tap

  @override
  void initState() {
    super.initState();
    _simulateLoading(); // Call simulate loading method
  }

  void _simulateLoading() async {
    await Future.delayed(
        Duration(seconds: 3)); // Step 2: Simulate loading for 3 seconds
    setState(() {
      _isLoading = false; // Step 3: Update loading state to false
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Container(
            height: 24, // Specify a fixed height for the SVG
            width: 24, // Specify a fixed width for the SVG
            child: SvgPicture.asset('assets/icons/Home.svg'), // Your SVG asset
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Container(
            height: 24, // Specify a fixed height for the SVG
            width: 24, // Specify a fixed width for the SVG
            child: SvgPicture.asset('assets/icons/send.svg'), // Your SVG asset
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Container(
            height: 24, // Specify a fixed height for the SVG
            width: 24, // Specify a fixed width for the SVG
            child:
                SvgPicture.asset('assets/icons/History.svg'), // Your SVG asset
          ),
          label: 'History',
        ),
        BottomNavigationBarItem(
          icon: Container(
            height: 24, // Specify a fixed height for the SVG
            width: 24, // Specify a fixed width for the SVG
            child: SvgPicture.asset(
                'assets/icons/schedules.svg'), // Your SVG asset
          ),
          label: 'scheduled',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.black, // Color when item is selected
      unselectedItemColor: Colors.grey, // Color when item is unselected
      onTap: _onItemTapped, // Update the state on tap
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
                child: Column(
                  children: [
                    // tabbar with two space
                    toggle(),
                    Gap(8),
                    const Divider(),
                    // search bar in a row with an icon
                    Row(
                      children: [
                        // search bar
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search',
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(
                                    10), // Adjust padding as needed
                                child: SvgPicture.asset(
                                    "assets/icons/search_ico.svg",
                                    fit: BoxFit.scaleDown),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none, // Remove border
                              ),
                              contentPadding: const EdgeInsets.all(10),
                              filled: true,
                              fillColor: Color(0xFFE6EAED),
                            ),
                          ),
                        ),
                        // svg icon for settings
                        SvgPicture.asset('assets/icons/settings.svg'),
                      ],
                    ),
                    const Gap(10),
                    // Scrollable part
                    const Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            // Your cards go here
                            // Example:
                            TransactionCard(
                              backgroundImage: "assets/images/mtn.png",
                              firstPersonName: 'Emmanuel Rockson ',
                              secondPersonName: 'Kwabena Uncle Ebo',
                              phoneNumber: "050 015 9892",
                              amount: "GHS 500",
                              status: "Successful",
                              iconPath: 'assets/icons/success.svg',
                              textColor: Colors.green,
                              backgroundColor: Color(0xFFDBF7E0),
                            ),
                            Gap(8),
                            TransactionCard(
                              backgroundImage: "assets/images/absa.png",
                              firstPersonName: 'Absa Bank',
                              secondPersonName: '',
                              textColor: Colors.red,
                              phoneNumber: "050 015 9892",
                              amount: "GHS 500",
                              status: "Failed",
                              iconPath: 'assets/icons/failed.svg',
                              backgroundColor: Color(0xFFFDB0AC),
                            ),
                            Gap(8),

                            TransactionCard(
                              backgroundImage: "assets/images/mtn.png",
                              firstPersonName: 'Emmanuel Rockson',
                              secondPersonName: '',
                              textColor: Colors.green,
                              phoneNumber: "050 015 9892",
                              amount: "GHS 500",
                              status: "Successful",
                              iconPath: 'assets/icons/success.svg',
                              backgroundColor: Color(0xFFDBF7E0),
                            ),
                            Gap(8),

                            TransactionCard(
                              backgroundImage: "assets/images/absa.png",
                              firstPersonName: 'Absa Bank',
                              secondPersonName: '',
                              textColor: Colors.red,
                              phoneNumber: "050 015 9892",
                              amount: "GHS 500",
                              status: "Failed",
                              iconPath: 'assets/icons/failed.svg',
                              backgroundColor: Color(0xFFFDB0AC),
                            ),
                            Gap(8),

                            // Add more cards as needed
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            // Action to be performed when the button is pressed
          },
          label: Text('SEND NEW', style: TextStyle(color: Colors.white)),
          backgroundColor: Color(0xFF01C7B1), // Text part of the button
          icon: const CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(Icons.add,
                color: Color(0xFF01C7B1)), // Adjust icon color as needed
          ),
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(8), // Adjust for desired curvature
          ),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerFloat, // Positioning

        bottomNavigationBar: _buildBottomNavigationBar(),
      ),
    );
  }

  Container toggle() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      color: Colors.grey[200],
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _isHistorySelected = true;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 20.0),
                decoration: BoxDecoration(
                  color: _isHistorySelected
                      ? Colors.white
                      : Colors.transparent, // Active tab background
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Center(
                  child: Text(
                    'History',
                    style: TextStyle(
                      fontWeight: _isHistorySelected
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _isHistorySelected = false;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 20.0),
                decoration: BoxDecoration(
                  color: !_isHistorySelected
                      ? Colors.white
                      : Colors.transparent, // Active tab background
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Center(
                  child: Text(
                    'Transaction Summary',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: !_isHistorySelected
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
