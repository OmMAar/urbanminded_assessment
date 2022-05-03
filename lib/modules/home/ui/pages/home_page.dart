import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:urbanminded_assessment/core/constants/app_enums.dart';
import 'package:urbanminded_assessment/core/constants/constants.dart';
import 'package:urbanminded_assessment/core/managers/localization/app_translation.dart';
import 'package:urbanminded_assessment/core/utils/utils.dart';
import 'package:urbanminded_assessment/core/widgets/animation/animation_list_view_widget.dart';
import 'package:urbanminded_assessment/core/widgets/button/rounded_button_widget.dart';
import 'package:urbanminded_assessment/core/widgets/common/horizontal_padding.dart';
import 'package:urbanminded_assessment/modules/home/data/models/site_model.dart';
import 'package:urbanminded_assessment/modules/home/domain/blocs/home_bloc.dart';
import 'package:urbanminded_assessment/modules/home/ui/widgets/site_item_widget.dart';
import 'package:uuid/uuid.dart';

import '../widgets/add_new_site_dialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String _btnText;
  late HomeBloc _homeBloc;

  late bool _disableBtn;
  late List<SiteModel> _sites;


  initList(){
    _sites = [
      SiteModel(
        id: "1",
        url: "https://www.test.com",
      ),
      SiteModel(
        id: "2",
        url: "https://www.google.com",
      ),
      SiteModel(id: "3", url: "https://www.microsoft.com"),
    ];
  }

  @override
  void initState() {
    super.initState();
    initList();
    _btnText = translate.start.toUpperCase();
    _homeBloc = HomeBloc();
    _disableBtn = false;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      elevation: 0.0,
      backgroundColor: AppColors.lightGrey,
      title: Container(
        alignment: AlignmentDirectional.centerStart,
        child: Text(
          translate.links,
          style: appTextStyle.subBigTSBasic
              .copyWith(color: AppColors.black, fontWeight: FontWeight.w900),
        ),
      ),
      actions: <Widget>[
        Container(
          alignment: AlignmentDirectional.center,
          child: RoundedButtonWidget(
              height: 30,
              borderRadius: AppRadius.radius6,
              backgroundColor: AppColors.black,
              disable: _disableBtn,
              onPressed: _processingTaskAction,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(AppDimens.space4),
                  child: Text(
                    _btnText,
                    style: appTextStyle.middleTSBasic.copyWith(
                        color: AppColors.white,
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              )),
        ),
        const HorizontalPadding(
          percentage: 0.02,
        ),
        Container(
          alignment: AlignmentDirectional.center,
          child: RoundedButtonWidget(
              height: 30,
              width: 30,
              borderRadius: AppRadius.radius6,
              backgroundColor: AppColors.black,
              onPressed: () async {
                final result = await showDialog(
                    context: context,
                    builder: (context) => const AddNewSiteDialog());
                if (result != null && result is String) {
                  WidgetsBinding.instance!.addPostFrameCallback((_) async {
                    setState(() {
                      var uuid = const Uuid();
                      _sites.add(SiteModel(id: uuid.v4(), url: result));
                    });
                  });
                }
              },
              child: const Center(
                child: Icon(Icons.add),
              )),
        ),
        const HorizontalPadding(
          percentage: 0.02,
        ),
      ],
    );
    double width = DeviceUtils.getScaledWidth(context, 1);
    double height = DeviceUtils.getScaledHeight(context, 1) -
        appBar.preferredSize.height -
        MediaQuery.of(context).viewPadding.top;
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: appBar,
      body: BlocListener<HomeBloc, HomeState>(
        bloc: _homeBloc,
        listener: (context, state) {
          if (state is HomeSuccess) {
            _successStateAction(state.siteID, state.responseLength);
          }
          if (state is HomeError) {
            appPrint("HomeError page");
            _failureStateAction(state.siteID, state.statusCode);
          }
          if (state is HomeLoading) {
            _sites[_sites.indexWhere((element) => element.id == state.siteId)]
                .status = SiteStatus.processing;
          }

          return;
        },
        child: BlocBuilder<HomeBloc, HomeState>(
            bloc: _homeBloc,
            builder: (context, state) {
              return SafeArea(
                child: AnimationListViewWidget(
                  duration: const Duration(milliseconds: 700),
                  itemBuilder: (context, index) => SiteItemWidget(
                    site: _sites[index],
                    onDeleteItem: () {
                      WidgetsBinding.instance!.addPostFrameCallback((_) async {
                        setState(() {
                          _sites.removeWhere(
                              (element) => element.id == _sites[index].id);
                        });
                      });
                    },
                  ),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => const Divider(
                    color: AppColors.black,
                    thickness: 1.0,
                  ),
                  isSeparated: true,
                  items: _sites,
                ),
              );
            }),
      ),
    );
  }

  _processingTaskAction() {
    if (_checkPendingTask()) {
      _disableBtn = true;
      _btnText = translate.processing;
      _homeBloc.add(StartSiteEvent(site: _getTheNextTask()));
    } else {
      if (_btnText == translate.reset) {
        _sites.map((e) {
          e.status = SiteStatus.pending;
          e.response = "";
        }).toList();
        _btnText = translate.start;
      } else {
        _disableBtn = false;
        _btnText = translate.reset;
      }
    }
    if (mounted) {
      setState(() {});
    }
  }

  SiteModel _getTheNextTask() {
    return _sites.firstWhere((element) => element.status == SiteStatus.pending);
  }

  bool _checkPendingTask() {
    var contain =
        _sites.where((element) => element.status == SiteStatus.pending);
    if (contain.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  _successStateAction(String siteID, String resLength) async {
    SiteModel siteModel = _sites.firstWhere((element) => element.id == siteID);
    siteModel.response = resLength;
    siteModel.status = SiteStatus.success;
    await Future.delayed(const Duration(milliseconds: 200));
    _processingTaskAction();
  }

  _failureStateAction(String siteID, String statusCode) async {
    SiteModel siteModel = _sites.firstWhere((element) => element.id == siteID);
    siteModel.response = statusCode;
    siteModel.status = SiteStatus.failure;
    await Future.delayed(const Duration(milliseconds: 200));
    _processingTaskAction();
  }
}
