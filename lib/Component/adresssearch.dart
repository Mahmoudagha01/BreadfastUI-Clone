import 'package:flutter/material.dart';

import '../Screens/placeprovider.dart';
import '../Screens/sugestion.dart';

class AddressSearch extends SearchDelegate<Suggestion> {
  PlaceApiProvider placeApiProvider = PlaceApiProvider();
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        tooltip: 'Clear',
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      tooltip: 'Back',
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, Suggestion('', ''));
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const SizedBox();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<List<Suggestion>>(
      future: placeApiProvider.fetchSuggestions(context, query: query),
      builder: (context, snapshot) => snapshot.hasData
          ? ListView.builder(
              itemBuilder: (context, index) => ListTile(
                minLeadingWidth: 0,
                leading: const Icon(
                  Icons.location_on_outlined,
                  color: Colors.blue,
                ),
                title: Text(
                  snapshot.data[index].description,
                ),
                onTap: () {
                  close(context, snapshot.data[index]);
                },
              ),
              itemCount: snapshot.data.length,
            )
          : const SizedBox(
              height: 100,
              child: Center(child: CircularProgressIndicator()),
            ),
    );
  }
}