import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:players/core/utils/app_font.dart';
import 'package:players/core/utils/app_strings.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_value.dart';
import '../../core/utils/components.dart';
import '../../cubit/app_cubit.dart';
import '../../data/models/players_model.dart';

class VerticalListWidget extends StatelessWidget {
  final AppCubit cubit;
  const VerticalListWidget(this.cubit, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          itemBuilder: (BuildContext context, int index) => buildVerticalList(
                cubit.resultSearch.isEmpty
                    ? cubit.players[index]
                    : cubit.resultSearch[index],
                () {
                  cubit.playerAdded.contains(cubit.players[index])
                      ? cubit.removePlayer(cubit.players[index])
                      : cubit.addPlayer(cubit.players[index]);
                },
                cubit.playerAdded.contains(cubit.players[index])
                    ? Colors.pinkAccent
                    : AppColors.primaryColor,
                cubit.playerAdded.contains(cubit.players[index])
                    ? AppStrings.remove
                    : AppStrings.add,
              ),
          separatorBuilder: (BuildContext context, int index) => SizedBox(
                height: AppSize.s10.h,
              ),
          itemCount: cubit.resultSearch.isEmpty
              ? cubit.players.length
              : cubit.resultSearch.length),
    );
  }

  Row buildVerticalList(PlayersModel playersModel, VoidCallback function,
      Color iconButtonColor, String textButton) {
    return Row(
      children: [
        CircleAvatar(
          radius: AppSize.s30.r,
          backgroundImage: NetworkImage(playersModel.image.toString()),
        ),
        SizedBox(
          width: AppSize.s20.w,
        ),
        Expanded(
          child: Text(
            "${playersModel.firstName} ${playersModel.lastName}",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: AppFontSize.s18),
          ),
        ),
        defaultButton(
            text: textButton,
            function: function,
            radius: AppSize.s25.r,
            backGround: iconButtonColor)
      ],
    );
  }
}
