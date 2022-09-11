import 'package:flutter/material.dart';
import 'package:top_listview_widgets/src/models/image.dart' as model;

class ImageDetailPage extends StatelessWidget {
  final model.Image imageDetail;
  const ImageDetailPage({Key? key, required this.imageDetail})
      : super(key: key);

  final defaultUrl =
      "https://images.unsplash.com/photo-1513635269975-59663e0ac1ad?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80";

  final defaultDescription="Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(imageDetail.description ?? "Londra"),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                imageDetail.raw ?? defaultUrl,
                height: 400,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      imageDetail.description ?? "London",
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10,),
                    Text(
                      imageDetail.altDescription ?? defaultDescription,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
}
