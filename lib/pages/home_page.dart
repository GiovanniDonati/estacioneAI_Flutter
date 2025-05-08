import 'package:flutter/material.dart';
import 'package:estacioneai/pages/dashboard_page.dart';
import 'package:estacioneai/pages/position_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageController = PageController(initialPage: 0);
  int pageNumber = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Home Page"),
          backgroundColor: Colors.blueAccent,
        ),
        drawer: Drawer(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                InkWell(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    width: double.infinity,
                    child: Text(
                      "Dashboards",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                                const PositionPage(title: "Position Page"),
                      ),
                    );
                  },
                ),
                InkWell(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    width: double.infinity,
                    child: Text(
                      "Estoque",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  onTap: () {},
                ),
                InkWell(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    width: double.infinity,
                    child: Text(
                      "Posições",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                                const PositionPage(title: "Position Page"),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: pageController,
                onPageChanged: (value) {
                  setState(() {
                    pageNumber = value;
                  });
                },
                children: [
                  Center(child: Text("Página Inicial")),
                  PositionPage(title: "Position Page"),
                  DashboardPage(),
                ],
              ),
            ),
            BottomNavigationBar(
              onTap: (value) {
                setState(() {
                  pageNumber = value;
                  pageController.jumpToPage(value);
                });
              },
              currentIndex: pageNumber,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.house), label: "Home"),
                BottomNavigationBarItem(
                  icon: Icon(Icons.local_parking),
                  label: "Positions",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "Dashboard",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
