import 'package:flutter/material.dart';
import 'package:star_wars_wiki/components/centered_message.dart';
import 'package:star_wars_wiki/components/circular_progress.dart';
import 'package:star_wars_wiki/components/people_list_view.dart';
import 'package:star_wars_wiki/http/webclients/people_webclient.dart';
import 'package:star_wars_wiki/models/people.dart';

class PeoplePage extends StatefulWidget {
  const PeoplePage({Key? key}) : super(key: key);

  @override
  State<PeoplePage> createState() => _PeoplePageState();
}

class _PeoplePageState extends State<PeoplePage> {
  final PeopleWebClient peopleClient = PeopleWebClient();
  late Future<List<People>> dataFuture;

  @override
  void initState() {
    super.initState();

    // fetch data from API
    dataFuture = peopleClient.getPeople();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<People>>(
      future: dataFuture,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            break;
          case ConnectionState.waiting:
            const Progress();
            break;
          case ConnectionState.active:
            break;
          case ConnectionState.done:
            if (snapshot.hasData) {
              return PeopleListView(snapshot.data!);
            } else if (snapshot.hasError) {
              final error = snapshot.error;
              return CenteredMessage('F: $error', icon: Icons.error);
            } else {
              return CenteredMessage('Unknown error', icon: Icons.error_outline);
            }
        }
        return const Progress();
      },
    );
  }
}
