import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:urbanminded_assessment/core/di/di.dart';
import 'package:urbanminded_assessment/core/managers/network/error_util.dart';
import 'package:urbanminded_assessment/core/utils/errors/base_error.dart';
import 'package:urbanminded_assessment/core/utils/errors/errors.dart';
import 'package:urbanminded_assessment/modules/home/data/models/site_model.dart';
import 'package:urbanminded_assessment/modules/home/domain/repo/home_repo_i.dart';

@immutable
abstract class HomeEvent extends Equatable {}

class StartSiteEvent extends HomeEvent {
  final SiteModel site;
  final CancelToken? cancelToken;

  StartSiteEvent({this.cancelToken, required this.site});

  @override
  List<Object> get props => [];

  @override
  String toString() => 'StartSiteEvent}';
}

@immutable
abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'HomeInitial';
}

class HomeLoading extends HomeState {
  final String siteId;

  const HomeLoading({required this.siteId});

  @override
  List<Object> get props => [siteId];

  @override
  String toString() => 'HomeLoading siteid: $siteId';
}

class HomeSuccess extends HomeState {
  final String siteID;
  final String responseLength;

  const HomeSuccess({required this.siteID,required this.responseLength});

  @override
  List<Object> get props => [siteID,responseLength];

  @override
  String toString() => 'HomeSuccess';
}

class HomeError extends HomeState {
  final String siteID;
  final String statusCode;

  const HomeError({required this.siteID,required this.statusCode});

  @override
  List<Object> get props => [siteID,statusCode];

  @override
  String toString() => 'HomeError';
}

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<StartSiteEvent>(_getSite);
  }

  final IHomeRepo _repository = findDep<IHomeRepo>();

  void _getSite(
    StartSiteEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoading(siteId: event.site.id));

    try {
      final results = await _repository.getSite(
          url: event.site.url, cancelToken: event.cancelToken);

      if (results.hasDataOnly) {
        emit(HomeSuccess(siteID: event.site.id,responseLength: results.data?.toString() ?? "success"));
      } else {
        emit(HomeError(siteID: event.site.id,statusCode: results.error?.statusCode.toString()??"unknown error"));
      }
    } catch (error) {
      BaseError err = ErrorUtil.handleError(error);
      emit(HomeError(siteID: event.site.id,statusCode: err.statusCode.toString()));

    }
  }
}
