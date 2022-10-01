import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_html_css/simple_html_css.dart';
import 'package:verona_colledge/view_model/shared/terms_cubit/terms_cubit.dart';
import 'package:verona_colledge/view_model/shared/terms_cubit/terms_states.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<TermsCubit,TermsStates>(
        builder: (_,state){
          return Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.white,
              leading: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.deepOrange,
                  )),
              title: Text(
                "Terms",
                style: GoogleFonts.poppins().copyWith(
                    color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
              ),
              centerTitle: true,

            ),
            body:Padding(
              padding: const EdgeInsets.all(8.0),
              child: ConditionalBuilder(
                condition: state is GetTermsDataSuccessState ,
                builder: (context)=> SingleChildScrollView(
                  child: RichText(
                    text: HTML.toTextSpan(context, TermsCubit.get(context).termsData!.data!.terms.toString(),defaultTextStyle: GoogleFonts.poppins().copyWith(
                        color: Colors.grey,fontSize: 20
                    )),

                  ),
                ),
                fallback: (context)=>Center(child: CircularProgressIndicator()),
              ),
            )
          );
        },
        listener: (_,state){},
    );
  }
}
