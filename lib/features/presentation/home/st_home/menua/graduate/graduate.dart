import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hti_university_app_1/core/api/addition/serviceApi.dart';
import 'package:hti_university_app_1/core/utils/constants/App_colors.dart';
import 'package:hti_university_app_1/core/widgets/cached_network_image_widget.dart';
import 'package:hti_university_app_1/features/data/repositories_impl/graduates_repo_imp.dart';
import 'package:hti_university_app_1/features/presentation/home/st_home/menua/graduate/cubit/graduations_cubit.dart';
import 'package:hti_university_app_1/features/presentation/home/st_home/menua/graduate/model/GraduatesModel.dart';
import 'package:shimmer/shimmer.dart';

import 'model/GraduateModle.dart';

class GraduateScreen extends StatelessWidget {
  static const String routeName = "GraduateScreen";

  const GraduateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => GraduationsCubit(
        GraduatesRepoImp(ServiceAPIs(Dio())))
      ..graduates(),
      child: BlocBuilder<GraduationsCubit, GraduationsState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Icon(Icons.arrow_back_ios)),
                  SizedBox(),
                  const Text('About Graduates',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w600)),
                  Image.asset(
                    "assets/images/logo_9.png", width: 37, height: 37,)
                ],
              ),
              centerTitle: true,
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            body: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset("assets/images/logo_9.png"),
                Column(
                  children: [
                    SizedBox(height: 20,),
                    Expanded(child: state is GraduationsLoading ?ListView.separated(
                      itemCount: 5, // عدد العناصر الوهمية
                      separatorBuilder: (_, __) => const SizedBox(height: 12),
                      itemBuilder: (_, __) => const ShimmerProfileCard(),
                    ) : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ProfileList(allGraduates: GraduationsCubit
                          .get(context)
                          .allGraduates!),
                    ))
                  ],
                ),
              ],
            ),
          );
        },),
    );
  }
}

class ProfileList extends StatelessWidget {
  const ProfileList({super.key, required this.allGraduates});

  final GraduatesModel allGraduates;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(height: 12,),
      itemCount: allGraduates.data!.length,
      itemBuilder: (context, index) {
        final data = allGraduates.data?[index];
        return ProfileCard(
          id: data?.id.toString() ?? "",
          imagePath: data?.photo ?? 'assets/images/negm.png',
          name: data?.name ?? "",
          title: data?.specialized ?? "",
          description:
          data?.profile ?? "",
        );
      },
    );
  }
}

class ProfileCard extends StatelessWidget {
  final String imagePath, name, title, description, id;

  const ProfileCard({
    super.key,
    required this.imagePath,
    required this.name,
    required this.title,
    required this.description,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GraduationsCubit, GraduationsState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade400,
                blurRadius: 6,
                offset: const Offset(4, 4),
              ),
              BoxShadow(
                color: Colors.grey.shade400,
                blurRadius: 6,
                offset: const Offset(-4, -4),
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                ProfileImage(imagePath: imagePath),
                const SizedBox(width: 16),
                Expanded(
                  child: ProfileDetails(
                    name: name,
                    title: title,
                    description: description,
                  ),
                ),
                ViewButton(graduate: GraduationsCubit
                    .get(context)
                    .graduate, id: id,),
              ],
            ),
          ),
        );
      },);
  }
}

class ProfileImage extends StatelessWidget {
  final String imagePath;

  const ProfileImage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.network(
        imagePath,
        width: 80,
        height: 100,
        fit: BoxFit.cover,
      ),
    );
  }
}

class ProfileDetails extends StatelessWidget {
  final String name, title, description;

  const ProfileDetails({
    super.key,
    required this.name,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Text(title,
            style: const TextStyle(fontSize: 14, color: Colors.grey)),
        const SizedBox(height: 8),
        Text(description,
            style: const TextStyle(fontSize: 13),
            maxLines: 3,
            overflow: TextOverflow.ellipsis),
      ],
    );
  }
}

class ViewButton extends StatelessWidget {
  const ViewButton({super.key, required this.graduate, required this.id });

  final GraduateModel? graduate;
  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GraduationsCubit, GraduationsState>(
      builder: (context, state) {
        return OutlinedButton(
          onPressed: () {
            showProfileBottomSheet(context, id: id);
          },
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Colors.blue),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30)),
          ),
          child: const Text('view', style: TextStyle(
              color: Colors.blue
          ),),
        );
      },);
  }
}

void showProfileBottomSheet(BuildContext context, {required String id}) {
  showModalBottomSheet(
    backgroundColor: Colors.white,
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    isScrollControlled: true,
    builder: (context) {
      return BlocProvider(
        create: (context) =>
        GraduationsCubit(GraduatesRepoImp(ServiceAPIs(Dio())))
          ..graduatesById(id: id),
        child: BlocBuilder<GraduationsCubit, GraduationsState>(
          builder: (context, state) {
            final data = GraduationsCubit.get(context).graduate?.data;
            return state is GraduationLoading ? buildProfileShimmer():
            Padding(
              padding: EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                  Positioned(
                  top: 15,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child:
                    CachedNetworkImageWidget(
                        imageUrl: data?.photo ?? '', width: 80, height: 100)
                ),),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(height: 16),
                  _buildRow("Name:", data?.name ?? ""),
                  _buildRow("Phone:", data?.phone ?? ""),
                  _buildRow("Age:", data?.age ?? ""),
                  _buildRow("Specialized:", data?.specialized ?? ""),
                  _buildRow("Work in a company:", data?.company ?? ""),
                  const SizedBox(height: 12),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Profile:",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    data?.profile ?? "",
                    style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
              ],
            ),)
            ,
            );
          },),
      );
    },
  );
}

Widget _buildRow(String title, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 20,),
        Text(
          value,
          style: TextStyle(color: Colors.grey[800]),
        ),
      ],
    ),
  );
}

Widget buildProfileShimmer() {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: SingleChildScrollView(
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          // صورة البروفايل
          Positioned(
            top: 15,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                width: 80,
                height: 100,
                color: Colors.grey[300],
              ),
            ),
          ),

          // باقي التفاصيل
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(height: 16),
              _buildShimmerRow(),
              _buildShimmerRow(),
              _buildShimmerRow(),
              _buildShimmerRow(),
              _buildShimmerRow(),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.centerLeft,
                child: Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    width: 80,
                    height: 16,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              _buildShimmerParagraph(),
              const SizedBox(height: 16),
            ],
          ),
        ],
      ),
    ),
  );
}

// صف واحد مثل: Name: ----------
Widget _buildShimmerRow() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6),
    child: Row(
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            decoration: BoxDecoration(
            color: Colors.white,
              borderRadius: BorderRadius.circular(12)
            ),
            width: 60,
            height: 14,
          ),
        ),
        const SizedBox(width: 16),
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            width: 150,
            height: 14,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12)
            ),
          ),
        ),
      ],
    ),
  );
}


// فقرة طويلة مثل الـ Profile
Widget _buildShimmerParagraph() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: List.generate(4, (index) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            width: double.infinity,
            height: 12,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12)
            ),
          ),
        ),
      );
    }),
  );
}



class ShimmerProfileCard extends StatelessWidget {
  const ShimmerProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 6,
            offset: const Offset(4, 4),
          ),
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 6,
            offset: const Offset(-4, -4),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            // صورة وهمية
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: 80,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(width: 16),

            // تفاصيل وهمية
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(3, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        height: 12 + index * 2,
                        width: double.infinity,
                        color: Colors.white,
                      ),
                    ),
                  );
                }),
              ),
            ),

            // زر وهمي
            const SizedBox(width: 12),
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: 60,
                height: 30,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

