import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:urbanminded_assessment/core/constants/app_enums.dart';
import 'package:urbanminded_assessment/core/constants/constants.dart';
import 'package:urbanminded_assessment/core/managers/localization/app_translation.dart';
import 'package:urbanminded_assessment/core/utils/utils.dart';
import 'package:urbanminded_assessment/core/widgets/common/rounded_widget.dart';
import 'package:urbanminded_assessment/core/widgets/widgets.dart';
import 'package:urbanminded_assessment/modules/home/data/models/site_model.dart';

class SiteItemWidget extends StatefulWidget {
  final SiteModel site;
  final Function() onDeleteItem;

  const SiteItemWidget({
    Key? key,
    required this.site,
    required this.onDeleteItem,
  }) : super(key: key);

  @override
  _SiteItemWidgetState createState() => _SiteItemWidgetState();
}

class _SiteItemWidgetState extends State<SiteItemWidget> {
  String? parsedDate;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = DeviceUtils.getScaledWidth(context, 1.0);
    double height = DeviceUtils.getScaledHeight(context, 0.15);
    return Container(
      //color: Colors.white,
      padding: const EdgeInsets.symmetric(
          horizontal: AppDimens.space20, vertical: AppDimens.space32),
      width: width,
      child: Slidable(
        // Specify a key if the Slidable is dismissible.
        key: Key(widget.site.id.toString() ),

        // The end action pane is the one at the right or the bottom side.
        endActionPane:  widget.site.status == SiteStatus.pending ? ActionPane(
          extentRatio: 0.2,
          motion: const ScrollMotion(),
          children:[
            SlidableAction(
              onPressed: doNothing,
              backgroundColor: AppColors.red,
              foregroundColor: AppColors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ):null,
        child: Container(
          child: Row(
            children: [
              ClipRRect(
                // borderRadius: BorderRadius.circular(AppRadius.radius6),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppRadius.radius6),
                      border: Border.all(color: AppColors.black, width: 2.0)),
                  child: ImageNetworkCircleWidget(
                    imageUrl: widget.site.image ?? "",
                    imageBorderRadius: AppRadius.radius6,
                    imagePlaceHolderBackgroundColor: AppColors.white,
                    imageWidth: 50,
                    imageHeight: 50,
                  ),
                ),
              ),
              const HorizontalPadding(
                percentage: 0.02,
              ),
              Expanded(
                  child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      widget.site.url,
                      style: appTextStyle.middleTSBasic.copyWith(
                          color: AppColors.black, fontWeight: FontWeight.bold),
                    ),
                    const VerticalPadding(
                      percentage: 0.02,
                    ),
                    Text(
                     "${_getStatusResponsePrefixStr(widget.site.status)} ${ widget.site.response ?? translate.unknownSize}",
                      style: appTextStyle.minTSBasic.copyWith(
                          color: _getResponseTxtColor(widget.site.status)),
                    ),
                  ],
                ),
              )),
              const HorizontalPadding(
                percentage: 0.02,
              ),
              _getStatusWidget(widget.site.status)
            ],
          ),
        ),
      ),
    );
  }

  Color _getResponseTxtColor(SiteStatus status) {
    switch (status) {
      case SiteStatus.pending:
        return AppColors.darkGrey;
      case SiteStatus.processing:
        return AppColors.darkGrey;
      case SiteStatus.success:
        return AppColors.darkGrey;
      case SiteStatus.failure:
        return AppColors.red;
    }
  }
  Widget _getStatusWidget(SiteStatus status) {
    Widget child;
    switch (status) {
      case SiteStatus.pending:
        child = Container(
        );
        break;
      case SiteStatus.processing:
        child = Container(
          alignment: AlignmentDirectional.center,
          child: const RoundedWidget(
              height: 40,
              width: 40,
              borderRadius: AppRadius.radius6,
              backgroundColor: AppColors.lightGrey,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(AppDimens.space4),
                  child: SpinKitThreeBounce(
                    color: AppColors.darkGrey,
                    size: 12,
                  ),
                ),
              )),
        );
        break;
      case SiteStatus.success:
        child = Container(
          alignment: AlignmentDirectional.center,
          child: RoundedWidget(
              height: 40,
              width: 40,
              borderRadius: AppRadius.radius6,
              backgroundColor: AppColors.green,
              child: FittedBox(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(AppDimens.space4),
                    child: Text(
                      translate.done,
                      style: appTextStyle.middleTSBasic.copyWith(
                          color: AppColors.white,
                          letterSpacing: 1.2,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              )),
        );
        break;
      case SiteStatus.failure:
        child = Container(
          alignment: AlignmentDirectional.center,
          child: RoundedWidget(
              height: 40,
              width: 40,
              borderRadius: AppRadius.radius6,
              backgroundColor: AppColors.red,
              child: FittedBox(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(AppDimens.space4),
                    child: Text(
                      translate.done,
                      style: appTextStyle.middleTSBasic.copyWith(
                          color: AppColors.white,
                          letterSpacing: 1.2,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              )),
        );
        break;
    }

    return child;
  }
  String _getStatusResponsePrefixStr(SiteStatus status) {

    switch (status) {
      case SiteStatus.pending:
        return "";

      case SiteStatus.processing:
        return "";
      case SiteStatus.success:
        return translate.size;
      case SiteStatus.failure:
        return translate.error;
    }
  }

  void doNothing(BuildContext context) {
    widget.onDeleteItem();
  }
}
