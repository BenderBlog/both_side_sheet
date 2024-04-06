import 'package:flutter/material.dart';

class CategoryChoiceView extends StatefulWidget {
  final (String, List<String>) data;
  const CategoryChoiceView({
    super.key,
    required this.data,
  });

  @override
  State<CategoryChoiceView> createState() => _CategoryChoiceViewState();
}

class _CategoryChoiceViewState extends State<CategoryChoiceView> {
  late String categoryChoiced;
  late List<String> subTags;

  static const skill = {
    "Tech.": [
      "Frontend",
      "Backend",
      "APP",
      "Game",
      "AI",
      "Hardware",
      "Database",
      "Maintain",
      "Testing",
      "Other",
    ],
    "Project": [
      "Text Stuff",
      "PPT",
      "Video Editing",
      "Others",
    ],
    "Marketing": [
      "Tiktok Maintainer",
      "Accountant",
      "Policy / Legal Stuff",
      "FOSS killer",
      "Others",
    ],
    "Product Design": [
      "UI Design",
      "Interactive Design",
      "Product Manager",
    ],
    "Others": [
      "Others",
    ],
  };

  @override
  void initState() {
    categoryChoiced = widget.data.$1;
    subTags = widget.data.$2;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        FilledButton(
          onPressed: () {
            Navigator.pop(context, (categoryChoiced, subTags));
          },
          child: const Text("Submit!"),
        ),
        ...List.generate(
          skill.keys.toList().length,
          (index) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: Text(skill.keys.toList()[index]),
                leading: Checkbox(
                  value: categoryChoiced == skill.keys.toList()[index],
                  onChanged: (bool? value) {
                    setState(() {
                      if (value == true &&
                          categoryChoiced != skill.keys.toList()[index]) {
                        categoryChoiced = skill.keys.toList()[index];
                      } else {
                        categoryChoiced = "";
                        return;
                      }
                    });
                  },
                ),
              ),
              Wrap(
                children: List.generate(
                  skill[skill.keys.toList()[index]]!.length,
                  (i) => TextButton(
                    onPressed: () {
                      setState(() {
                        if (subTags
                            .contains(skill[skill.keys.toList()[index]]![i])) {
                          subTags.remove(skill[skill.keys.toList()[index]]![i]);
                          return;
                        }
                        if (!subTags
                            .contains(skill[skill.keys.toList()[index]]![i])) {
                          subTags.add(skill[skill.keys.toList()[index]]![i]);
                          return;
                        }
                      });
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: subTags
                              .contains(skill[skill.keys.toList()[index]]![i])
                          ? Theme.of(context).colorScheme.primaryContainer
                          : null,
                    ),
                    child: Text(skill[skill.keys.toList()[index]]![i]),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
