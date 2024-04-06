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

（不是翻译，纯属第一印象）

Blue girls come in every size
Some are wise and some otherwise

忧伤的女孩们各有各的不同
有些难过，有些感动过

They got pretty blue eyes
For an hour a man may change
For an hour her face looks strange
Looks strange, looks strange

她们的眼睛蓝蓝的，水汪汪的
看着看着，男孩子的心就变了
看着看着，她的脸就变化了

Marching to the promised land
Where the honey flows
And takes you by the hand

他们手牵手，去向那流着蜜的应许之地

Pulls you down on your knees
While you're down a pool appears
The face in the water looks up

半途她摔了个跟头，看到了湖中，她脸庞的倒影

And she shakes her head as if to say
That it's the last time you'll look like today

她摇着头，好像在说
这是她今生今世，最后一次美丽的瞬间了

[Chorus]
Sail away, away
Ripples never come back
Gone to the other side
Sail away, away

湖畔涟漪阵阵，再也不会回来
他们摇摆着，慢慢滑向了另一侧

[Verse 2]
The face that launched a thousand ships
Is sinking fast, that happens you know

那张美丽的脸庞
在水中慢慢地消失
注释：一千艘船代表希腊神话中海伦的美貌导致的特洛伊战争

The water gets below, seems not very long ago
Lovelier she was than any that I know

她在湖中的倒影，好像又可爱了些

Angels never know it's time
To close the book
And gracefully decline

她们貌似永远不知什么时候
合上书，慢慢退去

The song has found a tale
My, what a jealous pool is she

天呐，她的美貌连湖泊都嫉妒不已

The face in the water looks up
She shakes her head as if to say
That the blue girls have all gone away

水中的倒影明晰了起来
她摇着头，好像在说
她今天再也不会伤心了

[Extended Chorus]
Sail away, away
Ripples never come back
They've gone to the other side

湖畔涟漪阵阵，再也不会回来
她们摇摆着，慢慢滑向了另一侧

Look into the pool, ripples never come back
Dive to the bottom and go to the top
To see where they have gone
They've gone to the other side

看着湖中的涟漪，她们不会再回来
我潜入湖中，又浮上来，想追上她们的痕迹
她们已经到达了对岸
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
                  title: "选择种类",
                );
                if (mounted) {
                  setState(() {});
                }
              },
              child: const Text("职位类型"),
            ),
            Text("Current type choice: $searchTags.")
          ],
        ),
      ),
    );
  }
}
