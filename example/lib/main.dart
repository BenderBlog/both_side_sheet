import 'package:both_side_sheet/both_side_sheet.dart';
import 'package:example/category_choice_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MainApp(),
  ));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  (String, List<String>)? searchTags;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () => BothSideSheet.show(
                context: context,
                title: "Both Side Sheet Example",
                child: const SingleChildScrollView(
                  child: Text('''
Ripples... / Genesis

Credit: Mike Rutherford & Tony Banks, 1976
With: Steve Hackett & Phil Collins
From: A Trick of the Tail

Blue girls come in every size
Some are wise and some otherwise

They got pretty blue eyes
For an hour a man may change
For an hour her face looks strange
Looks strange, looks strange

Marching to the promised land
Where the honey flows
And takes you by the hand

Pulls you down on your knees
While you're down a pool appears
The face in the water looks up

And she shakes her head as if to say
That it's the last time you'll look like today

[Chorus]
Sail away, away
Ripples never come back
Gone to the other side
Sail away, away

[Verse 2]
The face that launched a thousand ships
Is sinking fast, that happens you know

The water gets below, seems not very long ago
Lovelier she was than any that I know

Angels never know it's time
To close the book
And gracefully decline

The song has found a tale
My, what a jealous pool is she

The face in the water looks up
She shakes her head as if to say
That the blue girls have all gone away

[Extended Chorus]
Sail away, away
Ripples never come back
They've gone to the other side

Look into the pool, ripples never come back
Dive to the bottom and go to the top
To see where they have gone
They've gone to the other side
'''),
                ),
              ),
              child: const Text('Sad ballad'),
            ),
            TextButton(
              onPressed: () async {
                searchTags = await BothSideSheet.show<(String, List<String>)>(
                  context: context,
                  child: CategoryChoiceView(
                    data: searchTags ?? ("", []),
                  ),
                  title: "Type of position",
                );
                if (mounted) {
                  setState(() {});
                }
              },
              child: const Text("Change the type of position"),
            ),
            Text("Current type choice: $searchTags.")
          ],
        ),
      ),
    );
  }
}
