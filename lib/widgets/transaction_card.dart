import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hubtel_coding_challenge/models/transaction_model.dart';
import 'package:hubtel_coding_challenge/utils/app_colors.dart';
import 'package:hubtel_coding_challenge/utils/constants.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({super.key, required this.model});

  final TransactionModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: d.pSH(5)),

      // height: d.pSH(180),
      width: double.maxFinite,
      padding: EdgeInsets.all(d.pSH(16)),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: AppColors.textFieldColor),
          borderRadius: BorderRadius.circular(d.pSH(10))),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              DateFormat('h:mm a').format(DateTime.parse(model.date)),
              style: TextStyle(
                  color: AppColors.textFieldTextColor, fontSize: d.pSH(12)),
            ),
            SizedBox(
              height: d.pSH(2),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Row(
                    children: [
                      Flexible(
                        child: CircleAvatar(
                          // radius: d.pSH(30),
                          child: Image.asset(
                            'assets/images/${model.banks == Banks.absa ? 'absa' : 'momo'}.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: d.pSW(10),),
                      Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(model.name,style:const TextStyle(fontWeight: FontWeight.w600),),
                              Text(model.phone,
                                  style: TextStyle(
                                      color: AppColors.textFieldTextColor,
                                      fontWeight: FontWeight.bold)),
                            ],
                          )),
                    ],
                  ),
                ),

                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      // height: d.pSH(30),
                      child: Card(
                        color: model.status == TransactionStatus.success
                            ? AppColors.successFaintColor
                            : AppColors.failedFaintColor,
                        elevation: 0,
                        
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(d.pSH(13))),
                        child: Padding(
                          padding: EdgeInsets.all(d.pSH(8)),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (model.status != TransactionStatus.success)
                                SvgPicture.asset(
                                  "assets/icons/failed_svg.svg",
                                ),
                              if (model.status == TransactionStatus.success)
                                SvgPicture.asset(
                                  "assets/icons/done_svg.svg",
                                ),
                              SizedBox(
                                width: d.pSH(5),
                              ),
                              Text(
                                model.status == TransactionStatus.success
                                    ? "Successful"
                                    : "Failed",
                                style: TextStyle(
                                    color:
                                        model.status == TransactionStatus.success
                                            ? AppColors.successColor
                                            : AppColors.deepRedColor,
                                    fontSize: d.pSH(10),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "GHC ${model.amount}",
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: d.pSH(5),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: d.pSH(5)),
              height: d.pSH(2),
              width: double.maxFinite,
              color: AppColors.textFieldColor,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(

                  children: [
                    CircleAvatar(
                      backgroundColor: AppColors.violetFaintColor,
                      child: Icon(
                        Icons.person,
                        color: AppColors.violetColor,
                      ),
                    ),
                    SizedBox(
                      width: d.pSW(5),
                    ),
                    Text(
                      model.forMe ? "Personal" : "Other",
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: d.pSW(5),
                    ),
                    Icon(
                      Icons.circle,
                      color: AppColors.violetColor,
                      size: d.pSH(5),
                    ),
                    SizedBox(
                      width: d.pSW(5),
                    ),
                    Text(
                      model.reference,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
                if (model.isStarred)
                  SvgPicture.asset(
                    "assets/icons/favorite.svg",
                  ),
              ],
            )
          ]),
    );
  }
}
