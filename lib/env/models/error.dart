part of '../env.dart';

@model
class ErrorModel extends DModel {
  const ErrorModel({
    this.id,
    required this.title,
    required this.subtitle,
  });

  @variable
  final int? id;

  @variable
  final String title;

  @variable
  final String subtitle;

  static ErrorModel get error404 {
    return const ErrorModel(
      id: 404,
      title: 'Page Not Found',
      subtitle: "페이지가 없습니다!",
    );
  }
}
