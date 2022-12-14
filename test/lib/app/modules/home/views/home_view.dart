import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:movieapps/app/common/style.dart';
import 'package:movieapps/app/modules/login_page/controllers/login_page_controller.dart';
import 'package:movieapps/app/modules/login_page/views/login_page_view.dart';
import 'package:movieapps/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginPageController loginPage = Get.find();

    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              otherAccountsPictures: [
                IconButton(
                  onPressed: () {
                    Get.toNamed(
                      Routes.LOGIN,
                    );
                  },
                  icon: const Icon(
                    Icons.logout,
                    color: Colors.white,
                    size: 24.0,
                  ),
                ),
              ],
              accountName: Text("${loginPage.name}"),
              accountEmail: Text("${loginPage.email}"),
              currentAccountPicture: CircleAvatar(
                backgroundImage:
                    NetworkImage("https://i.ibb.co/PGv8ZzG/me.jpg"),
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/bg_drawel.jpg",
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'FilmKu',
          style: TextStyle(
            color: blueBanget,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Get.toNamed(Routes.SEARCH_PAGE);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Now Showing',
                    style: TextStyle(
                      fontSize: 35,
                      color: blueBanget,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.blueGrey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // <-- Radius
                      ),
                    ),
                    onPressed: () {
                      controller.fetchTrending();
                    },
                    child: const Text("See More"),
                  ),
                ],
              ),
            ),
            nowShowing(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Popular',
                    style: TextStyle(
                      fontSize: 35,
                      color: blueBanget,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.blueGrey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // <-- Radius
                      ),
                    ),
                    onPressed: () {
                      controller.fetchTrending();
                    },
                    child: const Text("See More"),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 6.0,
            ),
            popular(),
          ],
        ),
      ),
    );
  }

  Expanded nowShowing() {
    return Expanded(
      child: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (_) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: controller.trendingMoviews.length,
            itemBuilder: (context, index) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Get.toNamed(
                      Routes.DETAIL_MOVIE,
                      // Get Id Movie
                      arguments: controller.trendingMoviews[index].id,
                    );
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    shadowColor: Colors.black,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: FancyShimmerImage(
                        width: 145,
                        height: 215,
                        imageUrl:
                            'https://image.tmdb.org/t/p/w500/${controller.trendingMoviews[index].posterPath}',
                        boxFit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  width: 200,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      controller.trendingMoviews[index].title,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Icon(
                      Icons.star,
                      color: ratingBintang,
                      size: 30,
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      '${controller.trendingMoviews[index].voteAverage.toStringAsFixed(1)} / 10 IMDb',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Expanded popular() {
    return Expanded(
      child: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (_) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: controller.nowPlayingMovies.length,
            itemBuilder: (context, index) => Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.toNamed(Routes.DETAIL_MOVIE,

                            // Get Id Movie
                            arguments: controller.nowPlayingMovies[index].id);
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        shadowColor: Colors.black,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: FancyShimmerImage(
                              imageUrl:
                                  'https://image.tmdb.org/t/p/w500/${controller.nowPlayingMovies[index].posterPath}',
                              width: 200,
                              height: 300,
                              boxFit: BoxFit.cover),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 25.0,
                          ),
                          Text(
                            controller.nowPlayingMovies[index].title,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: ratingBintang,
                                size: 30,
                              ),
                              const SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                '${controller.nowPlayingMovies[index].voteAverage.toStringAsFixed(1)} / 10 IMDb',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w200,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              // Calendar icon
                              const Icon(
                                Icons.calendar_month,
                                color: Colors.grey,
                                size: 30,
                              ),
                              const SizedBox(
                                width: 5.0,
                              ),

                              Text(
                                DateFormat('dd MMMM yyyy').format(
                                  DateTime.parse(controller
                                      .nowPlayingMovies[index].releaseDate
                                      .toString()),
                                ),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
