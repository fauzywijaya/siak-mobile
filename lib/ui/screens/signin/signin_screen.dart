import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:siak_app/core/data/api.dart';
import 'package:siak_app/gen/assets.gen.dart';
import 'package:siak_app/ui/constant/constant.dart';
import 'package:siak_app/ui/router/route_list.dart';
import 'package:siak_app/ui/widgets/ErrorPlaceholder.dart';
import 'package:siak_app/ui/widgets/custom_dialog.dart';
import 'package:siak_app/ui/widgets/custom_text_field.dart';
import 'package:siak_app/utils/navigation_utils.dart';

import '../../../core/viewmodels/login/login_provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> with SingleTickerProviderStateMixin {

  late TabController _tabController;
  final _formMahasiswaKey = GlobalKey<FormState>();
  final _formOrangTuaKey = GlobalKey<FormState>();
  final _nimMahasiswaController = TextEditingController();
  final _nimOrangTuaController = TextEditingController();
  final _passwordMahasiswaController = TextEditingController();
  final _passwordOrangTuaController = TextEditingController();
  late bool _obsecuteText;

  @override
  void initState() {
    _obsecuteText = true;
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _nimMahasiswaController.dispose();
    _nimOrangTuaController.dispose();
    _passwordMahasiswaController.dispose();
    _passwordOrangTuaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: whiteSecondary,
      body: DefaultTabController(
        length: 2,
        child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.75,
                decoration: BoxDecoration(
                  color: bluePrimary,
                ),
              ),
              _buildContent(context)
            ]),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Consumer<LoginProvider>(
      builder: (context, provider, _) {
        switch (provider.postState) {
          case PostResultState.Loading:
            return Center(
              child: LoadingAnimationWidget.inkDrop(
                size: 100,
                color: Colors.white,
              ),
            );

          case PostResultState.Failure:
            return Center(
              child: ErrorPlaceHolder(
                animation: Assets.images.illustrationNoConnection.path,
                text: 'Ops! Sepertinya koneksi internetmu dalam masalah',
                hasButton: true,
                buttonText: 'Refresh',
                onButtonTap: () {
                  provider.setPostState(PostResultState.Idle);
                },
              ),
            );
          default:
            return _buildContainer(context, provider);
        }
      },
    );
  }

  Widget _buildFormMahasiswa(BuildContext context, LoginProvider loginProvider) {
    return Form(
      key: _formMahasiswaKey,
      child: ListView(
        children: [
          const SizedBox(height: 15,),
          Text("Masuk Sebagai Mahasiswa",
              style: styleTitle.copyWith(color: bluePrimary, fontSize: setFontSize(50)),
              textAlign: TextAlign.start),
          const SizedBox(height: 15),
          CustomTextField(
            hintText: "Masukan Nim Anda",
            keyboardType: TextInputType.number,
            controller: _nimMahasiswaController,
            icon: Icons.qr_code_2_rounded,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Nim tidak boleh kosong';
              } else if (value.length < 10) {
                return 'Nim tidak valid';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          TextFormField(
            obscureText: _obsecuteText,
            textAlignVertical: TextAlignVertical.center,
            showCursor: true,
            cursorColor: Theme.of(context).iconTheme.color,
            controller: _passwordMahasiswaController,
            keyboardType: TextInputType.emailAddress,
            maxLines: 1,
            decoration: InputDecoration(
                isCollapsed: true,
                contentPadding: const EdgeInsets.all(16.0),
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: bluePrimary),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: "Masukan Password Anda",
                prefixIcon: Icon(Icons.password_rounded, color: bluePrimary, size: 20),
                hintStyle:
                    styleTitle.copyWith(fontSize: setFontSize(40), fontWeight: FontWeight.w400),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obsecuteText ? Icons.visibility : Icons.visibility_off,
                    color: Colors.black54,
                  ),
                  onPressed: () {
                    setState(() {
                      _obsecuteText = !_obsecuteText;
                    });
                  },
                )),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Password tidak boleh kosong';
              } else if (value.length < 6) {
                return 'Password tidak boleh kurang dari 6 karakter';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            // ignore: sort_child_properties_last
            child: Text(
              'Sign In',
              style: TextStyle(
                color: whitePrimary,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: bluePrimary,
              minimumSize: const Size.fromHeight(30),
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 10.0,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            onPressed: () async {
              if (_formMahasiswaKey.currentState!.validate()) {

                LoadingAnimationWidget.inkDrop(
                      size: 100,
                      color: bluePrimary,
                );
                ScaffoldMessengerState scaffoldMessenger = ScaffoldMessenger.of(context);
                final result = await loginProvider.postLogin(
                  identitas: int.tryParse(_nimMahasiswaController.text) ?? 0,
                  password: _passwordMahasiswaController.text,
                );

                final snackBarError = SnackBar(
                  elevation: 0,
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.transparent,
                  content: AwesomeSnackbarContent(
                    title: result != null ? 'Sukses' : 'Ada Kesalahan!',
                    message: loginProvider.message,
                    contentType: result != null ? ContentType.success : ContentType.failure,
                  ),
                );
                scaffoldMessenger
                  ..hideCurrentSnackBar()
                  ..showSnackBar(snackBarError);

                if (result == null) {
                  final snackBarError = SnackBar(
                    elevation: 0,
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.transparent,
                    content: AwesomeSnackbarContent(
                      title: 'Ada!',
                      message: loginProvider.message,
                      contentType: ContentType.failure,
                    ),
                  );
                  scaffoldMessenger
                    ..hideCurrentSnackBar()
                    ..showSnackBar(snackBarError);
                  return;
                }
                navigate.pustToReplacement(routeHome);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Data Tidak Valid'),
                  ),
                );
              }
            },
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 80,
                height: 2,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      bluePrimary,
                      whitePrimary,
                    ],
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                  ),
                ),
              ),
              Text(
                "OR Sign In With",
                style: styleTitle.copyWith(color: blackPrimary, fontSize: setFontSize(40)),
              ),
              Container(
                width: 80,
                height: 2,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      whitePrimary,
                      bluePrimary,
                    ],
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 15),
          /// make circular button
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: 60,
              height: 60,
              child: FloatingActionButton(
                elevation: 0,
                backgroundColor: grayPrimary,
                child: SvgPicture.asset(
                  Assets.icons.iconGoogle.path,
                ),
                onPressed: () {
                  showDialog(context: context, builder: (context) => CustomDialog(
                    title: Text(
                      'Fitur ini sedang dalam tahap pengembangan',
                      style: TextStyle(
                          color: grayText,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                    content: SvgPicture.asset(
                      Assets.images.illustrationDevelopment.path,
                      height: 200,
                    ),
                  ));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormOrangTua(BuildContext context) {
    return Form(
      key: _formOrangTuaKey,
      child: ListView(
        children: [
          const SizedBox(height: 15,),
          Text("Masuk Sebagai Orang Tua",
              style: styleTitle.copyWith(color: bluePrimary, fontSize: setFontSize(50))),
          const SizedBox(height: 15),
          CustomTextField(
            hintText: "Masukan Nim Anda",
            keyboardType: TextInputType.number,
            controller: _nimOrangTuaController,
            icon: Icons.qr_code_2_rounded,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Nim tidak boleh kosong';
              } else if (value.length < 10) {
                return 'Nim tidak valid';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          TextFormField(
            obscureText: _obsecuteText,
            textAlignVertical: TextAlignVertical.center,
            showCursor: true,
            cursorColor: Theme.of(context).iconTheme.color,
            controller: _passwordOrangTuaController,
            keyboardType: TextInputType.emailAddress,
            maxLines: 1,
            decoration: InputDecoration(
                isCollapsed: true,
                contentPadding: const EdgeInsets.all(16.0),
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: bluePrimary),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: "Masukan Password Anda",
                prefixIcon: Icon(Icons.password_rounded, color: bluePrimary, size: 20),
                hintStyle:
                    styleTitle.copyWith(fontSize: setFontSize(40), fontWeight: FontWeight.w400),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obsecuteText ? Icons.visibility : Icons.visibility_off,
                    color: Colors.black54,
                  ),
                  onPressed: () {
                    setState(() {
                      _obsecuteText = !_obsecuteText;
                    });
                  },
                )),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Password tidak boleh kosong';
              } else if (value.length < 6) {
                return 'Password tidak boleh kurang dari 6 karakter';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            // ignore: sort_child_properties_last
            child: Text(
              'Sign In',
              style: TextStyle(
                color: whitePrimary,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: bluePrimary,
              minimumSize: const Size.fromHeight(30),
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 10.0,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            onPressed: () {
              if (_formOrangTuaKey.currentState!.validate()) {
                showDialog(context: context, builder: (context) => CustomDialog(
                  title: Text(
                    'Fitur ini sedang dalam tahap pengembangan',
                    style: TextStyle(
                        color: grayText,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                  content: SvgPicture.asset(
                    Assets.images.illustrationDevelopment.path,
                    height: 200,
                  ),
                ));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Data Tidak Valid'),
                  ),
                );
              }
            },
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 80,
                height: 2,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      bluePrimary,
                      whitePrimary,
                    ],
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                  ),
                ),
              ),
              Text(
                "OR Sign In With",
                style: styleTitle.copyWith(color: blackPrimary, fontSize: setFontSize(40)),
              ),
              Container(
                width: 80,
                height: 2,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      whitePrimary,
                      bluePrimary,
                    ],
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 15),

          /// make circular button
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: 60,
              height: 60,
              child: FloatingActionButton(
                // focusColor: bluePrimary,
                elevation: 0,
                backgroundColor: grayPrimary,
                child: SvgPicture.asset(
                  Assets.icons.iconGoogle.path,
                ),
                onPressed: () {
                  showDialog(context: context, builder: (context) => CustomDialog(
                    title: Text(
                      'Fitur ini sedang dalam tahap pengembangan',
                      style: TextStyle(
                          color: grayText,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                    content: SvgPicture.asset(
                      Assets.images.illustrationDevelopment.path,
                      height: 200,
                    ),
                  ));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContainer(BuildContext context, LoginProvider loginProvider) {
    return Center(
      child: Card(
          shadowColor: grayPrimary,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          clipBehavior: Clip.antiAlias,
          margin: const EdgeInsets.all(16),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16,16,16,8),
            child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.60,
                ),
                child: Column(
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                          color: grayPrimary,
                          border: Border.all(color: bluePrimary, width: 2),
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: TabBar(
                          unselectedLabelColor: bluePrimary,
                          labelColor: whitePrimary,
                          indicatorColor: Colors.white,
                          indicatorWeight: 2,
                          indicator: BoxDecoration(
                            color: bluePrimary,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          tabs: [
                            Tab(
                              child: Text(
                                "Mahasiswa",
                                style: TextStyle(
                                    fontSize: setFontSize(40), fontWeight: FontWeight.bold),
                              ),
                            ),
                            Tab(
                              child: Text(
                                "Orang Tua",
                                style: TextStyle(
                                    fontSize: setFontSize(40), fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: TabBarView(children: [
                        _buildFormMahasiswa(context, loginProvider),
                        _buildFormOrangTua(context),
                      ]),
                    ),
                  ],
                )),
          )),
    );
  }

}
