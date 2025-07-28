import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hti_university_app_1/core/extension/extension.dart';
import 'package:hti_university_app_1/dependency_inversion/di.dart';

import '../../../../../../core/service/files/upload_file_utils.dart';
import '../../../../../../core/utils/dialogs/awesome_dialoge.dart';
import '../../../../../../core/utils/dialogs/loading_dialog.dart';
import '../../../../../../core/utils/functions/handle_state/handle_state.dart';
import '../../../../../../core/widgets/cached_network_image_widget.dart';
import '../../../../login/view/log_in.dart';
import '../view_model/admin_profile_cubit.dart';

class AdminProfile extends StatefulWidget {
  const AdminProfile({super.key});

  @override
  State<AdminProfile> createState() => _AdminProfileState();
}

class _AdminProfileState extends State<AdminProfile> {
  var profileCubit = getIt.get<AdminProfileCubit>();
  @override
  void initState() {
    profileCubit.getProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => profileCubit,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: BackButton(color: Colors.black),
          centerTitle: true,
          title: Text(
            'Profile Page',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: BlocConsumer<AdminProfileCubit, AdminProfileState>(
          listener: (context, state) {
            if (state is DeleteAdminProfileLoading) {
              LoadingDialog.showLoadingDialog(context);
            }
            if (state is UpdateAdminProfileLoading) {
              LoadingDialog.showLoadingDialog(context);
            } else if (state is DeleteAdminProfileSuccess) {
              LoadingDialog.hideLoadingDialog(context);
              showAwesomeDialog(
                context,
                title: "Success",
                desc: "Delete Profile successfully",
                onOk: () {
                  profileCubit.getProfile();
                },
                dialogType: DialogType.success,
              );
            } else if (state is UpdateAdminProfileSuccess) {
              LoadingDialog.hideLoadingDialog(context);
              showAwesomeDialog(
                context,
                title: "Success",
                desc: "Update Profile successfully",
                onOk: () {
                  profileCubit.getProfile();
                },
                dialogType: DialogType.success,
              );
            } else if (state is DeleteAdminProfileError) {
              LoadingDialog.hideLoadingDialog(context);
              showAwesomeDialog(
                context,
                title: "Error",
                desc: state.exception.toString(),
                onOk: () {},
                dialogType: DialogType.error,
              );
            } else if (state is UpdateAdminProfileError) {
              LoadingDialog.hideLoadingDialog(context);
              showAwesomeDialog(
                context,
                title: "Error",
                desc: state.exception.toString(),
                onOk: () {},
                dialogType: DialogType.error,
              );
            }
          },
          builder: (context, state) {
            if (state is GetAdminProfileLoading) {
              return HandleState.loading();
            } else if (state is GetAdminProfileError) {
              return HandleState.error(state.exception, context);
            } else {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Image.asset(
                          'assets/images/Frame 1268 (1).png',
                          width: double.infinity,
                          height: 180,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          bottom: -50,
                          left: width / 2 - 60,
                          child: Stack(
                            clipBehavior: Clip.none,
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 4,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 8,
                                      offset: Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: ClipOval(
                                  child: CachedNetworkImageWidget(
                                    imageUrl: profileCubit.appUserEntity?.profilePhoto ?? "",
                                    height: 120,
                                    width: 120,
                                    fit: BoxFit.cover,
                                  //  cacheKey: "${profileCubit.appUserEntity?.profilePhoto ?? ""}_${DateTime.now().millisecondsSinceEpoch}", // مفتاح عشوائي
                                  ),
                                ),
                              ),
                              // زر الحذف
                              Positioned(
                                top: -10,
                                left: -10,
                              //  left: -10,
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () async {
                                      print("Delete profile tapped");
                                      profileCubit.deleteProfile();
                                    },
                                    splashColor: Colors.red.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(30),
                                    child: Container(
                                      padding: const EdgeInsets.all(6),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black26,
                                            blurRadius: 4,
                                          ),
                                        ],
                                      ),
                                      child: const Icon(
                                        Icons.delete,
                                        size: 28,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              // زر التحرير (وضعناه أخيرًا ليكون في الأعلى)

                              // Positioned(
                              //   bottom: 0,
                              //   right: 0,
                              //   child: Material(
                              //     color: Colors.transparent,
                              //     child: InkWell(
                              //       onTap: () async {
                              //         print("Edit profile photo tapped");
                              //         // final image = await FileUtils.uploadImageFromDevice();
                              //         // if (image != null) {
                              //         //   print("Image selected: ${image.path}");
                              //         //   profileCubit.updateProfile(photo: [image]);
                              //         //   setState(() {});
                              //         // } else {
                              //         //   print("No image selected");
                              //         //   showAwesomeDialog(
                              //         //     context,
                              //         //     title: "الرجاء المحاولة مرة أخرى",
                              //         //     desc: "لم يتم اختيار صورة أو المسار غير صالح",
                              //         //     onOk: () {},
                              //         //     dialogType: DialogType.error,
                              //         //   );
                              //         // }
                              //       },
                              //       splashColor: Colors.blue.withOpacity(0.3),
                              //       borderRadius: BorderRadius.circular(30),
                              //       child: Container(
                              //         padding: const EdgeInsets.all(12),
                              //         decoration: BoxDecoration(
                              //           shape: BoxShape.circle,
                              //           color: Colors.white,
                              //           boxShadow: [
                              //             BoxShadow(
                              //               color: Colors.black26,
                              //               blurRadius: 4,
                              //             ),
                              //           ],
                              //         ),
                              //         child: const Icon(
                              //           Icons.edit,
                              //           size: 28,
                              //           color: Colors.blue,
                              //         ),
                              //       ),
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    // زر التحرير (وضعناه أخيرًا ليكون في الأعلى)

                    SizedBox(height: 20),

                      InkWell(
                        onTap: () async {
                          print("Edit profile photo tapped");
                          final image = await FileUtils.uploadImageFromUrl();
                          if (image != null) {
                            profileCubit.updateProfile(photo: [image]);
                            setState(() {});
                          } else {
                            print("No image selected");
                            showAwesomeDialog(
                              context,
                              title: "الرجاء المحاولة مرة أخرى",
                              desc: "لم يتم اختيار صورة أو المسار غير صالح",
                              onOk: () {},
                              dialogType: DialogType.error,
                            );
                          }
                        },

                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 4,
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.edit,
                            size: 28,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    // ),
                    Text(
                      profileCubit.appUserEntity?.fullName ?? "Unknown",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),

                    /// شارة الدور
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        "${profileCubit.appUserEntity?.role ?? "Unknown"} ${profileCubit.appUserEntity?.major ?? "Unknown"}",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(height: 30),

                    /// عنوان المعلومات + زر تعديل
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        children: [
                          Text(
                            "General info:",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          Icon(Icons.edit, size: 20),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),

                    /// معلومات الإيميل
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30.0,
                        vertical: 8,
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.email_outlined, color: Colors.black),
                          SizedBox(width: 12),
                          Text(
                            profileCubit.appUserEntity?.email ?? "Unknown",
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ),

                    /// معلومات الهاتف
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30.0,
                        vertical: 8,
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.phone_outlined, color: Colors.black),
                          SizedBox(width: 12),
                          Text(
                            profileCubit.appUserEntity?.phoneNumber ??
                                "Unknown",
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 20),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }

  void _goNextToLoginScreen(BuildContext context) async {
    await context.appConfigProvider.logout();
    Navigator.pushNamedAndRemoveUntil(
      context,
      LogInScreen.routeName,
      (route) => false,
    );
  }
}
