import 'package:dynamic_tabbar/dynamic_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/assets.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 150,
            ),
            child: Text(
              'Hello Tony, What fruit salad combo do you want today?',
              style: TextStyle(
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
          Expanded(
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
                  content: Container(
                    child: const Text('Hottest'),
                  ),
                ),
                TabData(
                  index: 2,
                  title: const Tab(child: Text('Popular')),
                  content: Container(
                    child: const Text('Popular'),
                  ),
                ),
                TabData(
                  index: 2,
                  title: const Tab(child: Text('New combo')),
                  content: Container(
                    child: const Text('New combo'),
                  ),
                ),
                TabData(
                  index: 2,
                  title: const Tab(child: Text('Top')),
                  content: Container(
                    child: const Text('Top'),
                  ),
                ),
              ],
              onTabControllerUpdated: (tab) {},
            ),
          )
        ],
      ),
    );
  }
}

class RecommendedItem extends StatelessWidget {
  const RecommendedItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
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
    );
  }
}
