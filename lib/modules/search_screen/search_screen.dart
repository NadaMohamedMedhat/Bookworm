import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:graduation_project/modules/search_screen/cubit/search_cubit.dart';

import '../../widgets/reusable_components.dart';
import '../BooksScreen/book_details_screen.dart';
import 'cubit/search_states.dart';

class SearchScreen extends StatelessWidget {
  // SearchCubit? searchCubit;
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchStates>(
      listener: (context, state) {
        // var newList = [
        //   ...?SearchCubit.get(context).searchModel!.data,
        //   ...?SearchCubit.get(context).searchModel!.data1,
        //   ...?SearchCubit.get(context).searchModel!.data2,
        //   ...?SearchCubit.get(context).searchModel!.data3,
        //   ...?SearchCubit.get(context).searchModel!.data4
        // ];
      },
      builder: (context, state) {
        //var list = []..addAll(SearchCubit.get(context).searchModel!.data!)..addAll(SearchCubit.get(context).searchModel!.data1!);
        return SafeArea(
          child: Scaffold(
              body: Container(
            decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 22),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).backgroundColor,
                        border: Border.all(color: secondColor, width: 2)),
                    child: TextFormField(
                      style: Theme.of(context).textTheme.subtitle1,
                      controller: searchController,
                      textCapitalization: TextCapitalization.words,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'Search with name OR year OR author',
                        hintStyle: Theme.of(context).textTheme.subtitle2,
                        prefixIcon: const Icon(Icons.search),
                      ),
                      onChanged: (value) {
                        SearchCubit.get(context).getSearchData(value);
                      },
                    ),
                  ),
                  // defaultFormField(
                  //   context: context,
                  //   controller: searchController,
                  //   inputType: TextInputType.text,
                  //   label: 'Search',
                  //   filledColor: const Color.fromARGB(253, 220, 252, 231),
                  //   onSubmit: (value) {
                  //     SearchCubit.get(context).getSearchData(value);
                  //   },
                  //   // onChange: (dynamic value) {
                  //   //   SearchCubit.get(context).getSearchData(value);
                  //   // },
                  //   prefixIcon: Icons.search,
                  // ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  if (state is SearchLoadingState)
                    const Center(
                      child: Image(
                        image: AssetImage('assets/images/loading.gif'),
                        height: 90,
                        width: 90,
                      ),
                    ),
                  ConditionalBuilder(
                      condition: state is SearchSuccessState,
                      builder: (context) {
                        return SearchCubit.get(context).searchModel!.data != []
                            ? Expanded(
                                child: ListView.separated(
                                  physics: const BouncingScrollPhysics(),
                                  itemBuilder: (context, index) =>
                                      searchItemBuilder(
                                          SearchCubit.get(context)
                                              .searchModel!
                                              .data![index],
                                          context),
                                  separatorBuilder: (context, index) =>
                                      Container(),
                                  itemCount: SearchCubit.get(context)
                                      .searchModel!
                                      .data!
                                      .length,
                                ),
                              )
                            : Center(
                                child: Text(
                                  'The Book isn\'t available',
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
                              );
                      }),
                  if (state is SearchErrorState)
                    Column(
                      children: [
                        const SizedBox(height: 200,),
                        Center(
                          child: Text(
                            'The Book isn\'t available',
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                        ),
                      ],
                    )
                ],
              ),
            ),
          )),
        );
      },
    );
  }
  //create: (context) => SearchCubit()

  Widget searchItemBuilder(model, context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, BookDetailsScreen.routePass,
            arguments: model.id);
      },
      child: Container(
          decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 7,
                shadowColor: Colors.grey[700],
                child: ClipRRect(
                  //borderRadius: BorderRadius.all(Radius.circular(13)),
                  child: Image(
                    image: NetworkImage(
                      model.url1!,
                    ),
                    //'https://image.freepik.com/free-psd/beautiful-fantasy-text-effect_23-2149110337.jpg'),
                    height: 230,
                    width: 170,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 5.0,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        model.name!,
                        style: Theme.of(context).textTheme.subtitle1,
                        maxLines: 2,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(model.author!,
                          style: Theme.of(context).textTheme.subtitle2),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(model.categories!,
                          style: Theme.of(context).textTheme.subtitle2),
                      const SizedBox(
                        height: 17,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.black54),
                        width: 100,
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                model.rate.toString(),
                                style: const TextStyle(color: Colors.yellow),
                              ),
                            ),
                            const Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                          ],
                        ),
                      ),
                      // Text(model.rate.toString()),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}


   // final player = AudioPlayer();
 //  AudioPlayer audioPlayer = AudioPlayer();
// import 'package:assets_audio_player/assets_audio_player.dart';
// import 'package:flutter/material.dart';

// class AudioPlayerBackgroundPlaylist extends StatefulWidget {
//   @override
//   _AudioPlayerBackgroundPlaylistState createState() =>
//       _AudioPlayerBackgroundPlaylistState();
// }

// class _AudioPlayerBackgroundPlaylistState
//     extends State<AudioPlayerBackgroundPlaylist> {
//   final AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();

//   @override
//   void initState() {
//     super.initState();
//     setupPlaylist();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     audioPlayer.dispose();
//   }

//   void setupPlaylist() async {
//     audioPlayer.open(
//         Playlist(audios: [
//           /// For playing local assets, add Audio('assets/music.mp3')
//           /// For playing local file, add Audio.file('path/to/file')
//           Audio.network(
//               'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-13.mp3',
//               metas: Metas(title: 'Song1', artist: 'Artist1')),
//           Audio.network(
//               'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-14.mp3',
//               metas: Metas(title: 'Song2', artist: 'Artist2')),
//           Audio.network(
//               'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-15.mp3',
//               metas: Metas(title: 'Song3', artist: 'Artist3')),
//         ]),
//         showNotification: true,
//         autoStart: false);
//   }

//   playMusic() async {
//     await audioPlayer.play();
//   }

//   pauseMusic() async {
//     await audioPlayer.pause();
//   }

//   skipPrevious() async {
//     await audioPlayer.previous();
//   }

//   skipNext() async {
//     await audioPlayer.next();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         alignment: Alignment.center,
//         child: audioPlayer.builderIsPlaying(builder: (context, isPlaying) {
//           return Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               IconButton(
//                   iconSize: 50,
//                   icon: Icon(Icons.skip_previous_rounded),
//                   onPressed: () => skipPrevious()),
//               IconButton(
//                   iconSize: 50,
//                   icon: Icon(isPlaying
//                       ? Icons.pause_rounded
//                       : Icons.play_arrow_rounded),
//                   onPressed: () => isPlaying ? pauseMusic() : playMusic()),
//               IconButton(
//                   iconSize: 50,
//                   icon: Icon(Icons.skip_next_rounded),
//                   onPressed: () => skipNext())
//             ],
//           );
//         }),
//       ),
//     );
//   }
// }