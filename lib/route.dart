import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pills/models/pills_model.dart';
import 'package:pills/models/word_entity.dart';
import 'package:pills/page/book_marks.dart';
import 'package:pills/page/dash_board.dart';
import 'package:pills/page/dictinary_page.dart';
import 'package:pills/page/home_page.dart';
import 'package:pills/page/main_page.dart';
import 'package:pills/page/pills_list_page.dart';
import 'package:pills/widget/pills_category.dart';
import 'package:pills/widget/pills_detail.dart';
import 'package:pills/widget/pills_widget.dart';
import 'package:pills/widget/word_detail.dart';

final router = GoRouter(initialLocation: "/home_page", routes: [
  GoRoute(path: "/dash_board", builder: (context, state) => const Dashboard()),
  StatefulShellRoute.indexedStack(
      builder: (BuildContext context, GoRouterState state,
          StatefulNavigationShell navigationShell) {
        return MainPage(navigationShell: navigationShell);
      },
      branches: <StatefulShellBranch>[
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: '/home_page',
              builder: (BuildContext context, GoRouterState state) =>
                  HomePage(),
            ),
            GoRoute(
                path: '/pills_category/:category',
                builder: (BuildContext context, GoRouterState state) {
                  final category = state.pathParameters['category']!;
                  return PillsListPage(pillsCategory: category,);
                }),
             GoRoute(
                path: '/pills_detail/:pills_name',
                builder: (BuildContext context, GoRouterState state) {
                  final pillsmodel = state.extra as PillsModel;
                  return PillsDetail(pillsModel: pillsmodel);
                }),
            
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: '/book_marks',
              builder: (BuildContext context, GoRouterState state) =>
                  BookMarks(),
            ),
            GoRoute(
                path: '/book_marks:id',
                builder: (BuildContext context, GoRouterState state) {
                  final id = state.pathParameters['id'];
                  return BookMarks();
                }),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: '/dictionary_page',
              builder: (BuildContext context, GoRouterState state) =>
                  DictinaryPage(),
            ),
            GoRoute(
                path: '/word_detail/:word',
                builder: (BuildContext context, GoRouterState state) {
                  final wordEntity = state.extra as WordEntity;
                  return WordDetail(wordEntity: wordEntity);
                }),
            
          ],
        ),
      ])
]);
