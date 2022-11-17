import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:players/core/utils/app_strings.dart';
import 'package:players/core/utils/components.dart';
import 'package:players/cubit/app_cubit.dart';
import 'package:players/presentation/widgets/error_widget.dart';

import '../../core/utils/app_font.dart';
import '../../core/utils/app_value.dart';
import '../../cubit/app_state.dart';
import '../widgets/horizontal_list_widget.dart';
import '../widgets/vertical_list_widget.dart';

class AddPlayersScreen extends StatelessWidget {
  const AddPlayersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppStrings.appName,
        ),
      ),
      body: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          var cubit = AppCubit.getCubit(context);
          var players = cubit.players;
          if (state is LoadingAddPlayersState) {
            return const Center(child: CircularProgressIndicator());
          } else if (players.isNotEmpty) {
            return Column(
              children: [
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: AppSize.s90.h,
                          child: HorizontalListWidget(cubit),
                        ),
                        SizedBox(
                          height: AppSize.s20.h,
                        ),
                        defaultTextFormField(
                          controller: cubit.searchController,
                          prefixIcon: Icons.search,
                          suffixIcon: cubit.isSearch == true
                              ? Icons.clear_outlined
                              : null,
                          suffixPressed: () {
                            cubit.searchController.text = "";
                            cubit.searchPlayer("");
                            cubit.isSearch = false;
                          },
                          onChanged: (value) {
                            cubit.searchPlayer(value);
                            if (cubit.searchController.text.isEmpty) {
                              cubit.isSearch = false;
                            }
                            return "";
                          },
                          keyboardType: TextInputType.name,
                          label: AppStrings.searchByPlayerName,
                        ),
                        SizedBox(
                          height: AppSize.s20.h,
                        ),
                        VerticalListWidget(cubit),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: AppSize.s70.h,
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppPadding.p20, vertical: AppPadding.p10),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.grey[AppSize.s200.toInt()]!)),
                  child: defaultButton(
                      text: AppStrings.continueTo,
                      fontSize: AppFontSize.s20,
                      height: AppSize.s50.h,
                      function: () {},
                      width: double.infinity.w,
                      radius: AppSize.s20.r),
                ),
              ],
            );
          } else if (state is ErrorAddPlayersState) {
            return ErrorWidgetScreen(
                onPress: () {
                  cubit.getAllPlayers();
                },
                errorMessage: cubit.errorMessage);
          } else {
            return ErrorWidgetScreen(
                onPress: () {
                  cubit.getAllPlayers();
                },
                errorMessage: cubit.errorMessage);
          }
        },
      ),
    );
  }
}
