import 'package:eetu_portfolio/l10n/generated/s.dart';
import 'package:eetu_portfolio/state/detail_dialog/detail_dialog_listener.dart';
import 'package:eetu_portfolio/state/detail_dialog/detail_dialog_provider.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';

class Skills extends StatelessComponent {
  @override
  Component build(BuildContext context) {
    final ddp = DetailDialogProvider.of(context);
    final s = S.of(context)!;
    final skills = [
      ('Flutter', 'fab fa-flutter', s.flutter_desc),
      ('React', 'fab fa-react', s.react_desc),
      ('AWS', 'fab fa-aws', s.aws_desc),
      ('Firebase', 'fas fa-fire', s.firebase_desc),
      ('Figma', 'fab fa-figma', s.figma_desc),
      ('Golang', 'fab fa-golang', s.golang_desc),
      ('CI/CD', 'fas fa-infinity', s.cicd_desc),
      ('Wordpress', 'fab fa-wordpress', s.wordpress_desc),
      ('Python', 'fab fa-python', s.python_desc),
      ('C#', 'fas fa-code', s.csharp_desc),
    ];

    return section(id: 'skills', classes: 'reveal', [
      h2(
        classes: 'text-3xl font-bold mb-16 neon-text text-left md:text-center',
        [Component.text(s.skills_title)],
      ),
      div(classes: 'grid grid-cols-2 gap-x-2 gap-y-4 md:grid-cols-4 md:gap-6', [
        for (var skill in skills)
          div(
            events: ddp.open
                ? null
                : {
                    'click': (event) {
                      ddp.openDialog(DialogData(skill.$1, skill.$3));
                    },
                  },
            classes:
                'glass-card p-8 rounded-2xl text-center group hover:neon-border',
            [
              i(
                classes:
                    '${skill.$2} text-4xl mb-4 group-hover:scale-110 transition-transform',
                [],
              ),
              h4(classes: 'font-bold', [Component.text(skill.$1)]),
            ],
          ),
      ]),
    ]);
  }
}
