import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcareapp/core/appcolors/colors.dart';
import 'package:vcareapp/features/login_register_feature/views/widgets/custom_text_form_field.dart';
import 'package:vcareapp/features/search/view%20model/search_cubit.dart';

import '../../../core/appfont/styles.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(body: BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        var cubit=BlocProvider.of<SearchCubit>(context);
        return SafeArea(
          child: Column(
            children: [
              Material(elevation: 10,
                child: CustomTextFormField(icon: InkWell(onTap: (){
                  Navigator.pop(context);
                },
                    child: const Icon(Icons.arrow_back,color: AppColors.primaryColor,)),
                    onFieldSubmitted: (value){
                  cubit.searchForDoctor();
                },
                    hintText: 'Search for a doctor',
                    inputType: TextInputType.text,
                    controller: cubit.searchController),
              ),
           SizedBox(height: 14.h,),
           cubit.searchResults.isEmpty ?Expanded(child: Center(child: Image.asset('assets/images/search.png',width: 250.w),)) :
           Expanded(
             child: Padding(
               padding:  EdgeInsets.symmetric(horizontal: 16.w),
               child: ListView.builder(physics: const BouncingScrollPhysics(),
                 itemBuilder: (context,index){
                    return  Padding(
                      padding:  EdgeInsets.only(bottom: 10.h),
                      child: ListTile(tileColor: Colors.grey[200],
                        leading: Image.network(cubit.searchResults[index].photo,fit: BoxFit.fill),
                        subtitle: Text(cubit.searchResults[index].specialization.name),
                        title: Text(cubit.searchResults[index].name,style: Styles.textStyle20),),
                    );
                  }
                      ,itemCount: cubit.searchResults.length,),
             ),
           )
            ],
          ),
        );
      },
    ),);
  }
}
