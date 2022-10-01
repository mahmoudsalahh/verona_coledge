import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:verona_colledge/view/news_screen/news_frist.dart';
import 'package:verona_colledge/view/news_screen/news_second.dart';
import 'package:verona_colledge/view_model/shared/cubit/cubit.dart';
import 'package:verona_colledge/view_model/shared/shared.component/constant.dart';

import '../../view_model/shared/cubit/states.dart';


class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
            listener:(BuildContext contxet ,state){} ,
            builder:(BuildContext contxet ,state){
              return SafeArea(
            child: Padding(
                padding:  EdgeInsets.all(20.0),
                child: AnimatedCrossFade(
                  duration:  Duration(seconds: 3),
                  firstChild: NewsFrist(),
                  secondChild:NewsSecond(),
                  crossFadeState: first ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                ),));
            });
  }
}
