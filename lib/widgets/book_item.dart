import 'package:flutter/material.dart';
import 'package:graduation_project/models/home_model.dart';
import '../modules/BooksScreen/book_details_screen.dart';

Widget bookItem(Book model, ctx) => InkWell(
      //final fashionId = ModalRoute.of(ctx)!.settings.arguments.toString();
      onTap: () {
        Navigator.pushNamed(ctx, BookDetailsScreen.routePass,
            arguments: model.id);
      },
      child: Container(
        // //color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 7,
              shadowColor: Colors.grey[900],
              child: Stack(
                alignment: AlignmentDirectional.topEnd,
                children: [
                  Hero(
                    tag: model.id!,
                    child: Image(
                      image: NetworkImage(model.url1!),
                      width: double.infinity,
                      height: 240.0,
                    ),
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
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(model.name!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(ctx).textTheme.subtitle2),
                ],
              ),
            ),
          ],
        ),
      ),
    );

Widget CategoryBookItem(Book model, context, route) => InkWell(
      //final fashionId = ModalRoute.of(ctx)!.settings.arguments.toString();
      onTap: () {
        Navigator.pushNamed(context, route,
            arguments: model.id);
      },
      child: Container(
          // color: Colors.white,
          child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            elevation: 7,
            shadowColor: Colors.grey[700],
            child: ClipRRect(
              child: Hero(transitionOnUserGestures: true,
                tag: model.id!,
                child: Image(
                  image: NetworkImage(
                    model.url1!,
                  ),
                  height: 230,
                  width: 170,
                  fit: BoxFit.cover,
                ),
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
                  Container(
                    child: Text(
                      model.name!,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
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
                ],
              ),
            ),
          )
        ],
      )),
    );
