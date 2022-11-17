import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:players/cubit/app_cubit.dart';
import 'package:players/data/models/players_model.dart';

import '../../core/utils/app_value.dart';

class HorizontalListWidget extends StatelessWidget {
  final AppCubit cubit;
  const HorizontalListWidget(this.cubit, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) => buildHorizontalList(
          cubit.playerAdded[index],
          () => cubit.removePlayer(cubit.playerAdded[index])),
      separatorBuilder: (BuildContext context, int index) => SizedBox(
        width: AppSize.s30.w,
      ),
      itemCount: cubit.playerAdded.length,
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
    );
  }

  Column buildHorizontalList(PlayersModel player, VoidCallback function) {
    return Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            CircleAvatar(
              radius: AppSize.s30.r,
              backgroundImage: NetworkImage(player.image.toString()),
            ),
            if (player.id != 99)
              InkWell(
                onTap: function,
                child: Container(
                  height: AppSize.s25.h,
                  width: AppSize.s25.w,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(AppSize.s20.r),
                      border: Border.all(
                        color: Colors.grey,
                      )),
                  child: const Icon(
                    Icons.clear_outlined,
                    color: Colors.red,
                  ),
                ),
              )
          ],
        ),
        SizedBox(
          height: AppSize.s7.h,
        ),
        Text(
          "${player.firstName} ${player.lastName}",
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}
