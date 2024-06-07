part of '../home.dart';

enum HomePricingType { month, year, forever }

@model
class HomePricingModel extends DModel {
  const HomePricingModel({
    required this.title,
    required this.imagePath,
  });
  @variable
  final String imagePath;

  @variable
  final String title;
}
