import 'package:dynamic_tabbar/dynamic_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../provider/splash_provider.dart';
import '../utils/assets.dart';
import '../utils/routes/route_keys.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            context.read<SplashProvider>().localStorage!.clear();
            context.read<SplashProvider>().firstName = '';
            Navigator.pushReplacementNamed(context, routeWelcome);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 150,
              ),
              child: Text(
                'Hello ${context.watch<SplashProvider>().firstName}, What fruit salad combo do you want today?',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      filled: true,
                      fillColor: Color(0xffF3F1F1),
                      hintText: 'Search for fruit salad combos',
                      hintStyle: TextStyle(
                        color: Color(0xffB1B1B1),
                        fontSize: 14,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: SvgPicture.asset(
                    filterIcon,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              '  Recommended Combo',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                children: const [
                  RecommendedItem(),
                  RecommendedItem(),
                  RecommendedItem()
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: DynamicTabBarWidget(
                dividerHeight: 0,
                indicatorColor: Colors.orange,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorPadding: const EdgeInsets.only(
                  right: 80,
                ),
                labelPadding: EdgeInsets.zero,
                labelStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                unselectedLabelStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                dynamicTabs: [
                  TabData(
                    index: 1,
                    title: const Tab(child: Text('Hottest')),
                    content: GridView.count(
                      crossAxisCount: 2,
                      physics: const NeverScrollableScrollPhysics(),
                      // mainAxisSpacing: 10,
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      cacheExtent: 4,
                      childAspectRatio: 0.8,
                      children: const [
                        RecommendedItem(),
                        RecommendedItem(),
                        RecommendedItem(),
                        RecommendedItem(),
                      ],
                    ),
                  ),
                  TabData(
                    index: 2,
                    title: const Tab(child: Text('Popular')),
                    content: GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),

                      // mainAxisSpacing: 10,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      cacheExtent: 4,
                      childAspectRatio: 0.8,
                      children: const [
                        RecommendedItem(),
                        RecommendedItem(),
                        RecommendedItem(),
                        RecommendedItem(),
                      ],
                    ),
                  ),
                  TabData(
                    index: 2,
                    title: const Tab(child: Text('New combo')),
                    content: GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),

                      // mainAxisSpacing: 10,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      cacheExtent: 4,
                      childAspectRatio: 0.8,
                      children: const [
                        RecommendedItem(),
                        RecommendedItem(),
                        RecommendedItem(),
                        RecommendedItem(),
                      ],
                    ),
                  ),
                  TabData(
                    index: 2,
                    title: const Tab(child: Text('Top')),
                    content: GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),

                      crossAxisCount: 2,
                      // mainAxisSpacing: 10,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      cacheExtent: 4,
                      childAspectRatio: 0.8,
                      children: const [
                        RecommendedItem(),
                        RecommendedItem(),
                        RecommendedItem(),
                        RecommendedItem(),
                      ],
                    ),
                  ),
                ],
                onTabControllerUpdated: (tab) {
                  print(tab);
                },
              ),
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}

class RecommendedItem extends StatelessWidget {
  const RecommendedItem({
    super.key,
    this.bgColor,
  });

  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, routeViewItem);
      },
      child: Card(
        color: bgColor,
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.25,
          width: MediaQuery.of(context).size.width * 0.45,
          child: Column(
            children: [
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite_outline,
                    color: Colors.orange,
                  ),
                ),
              ),
              Image.asset(
                splashImage,
                height: 100,
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Fruit Salad Combo',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    r'$2000',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      addIcon,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
