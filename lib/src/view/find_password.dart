import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/responsible_layout.dart';
import 'package:induk_club_promotion_app_project/src/widget/login_text_field.dart';
import 'package:induk_club_promotion_app_project/src/widget/sign_button.dart';

class FindPassword extends StatelessWidget {
  const FindPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
          appBar: (ResponsibleLayout.isMobile(context))
              ? AppBar(
                  leading: GestureDetector(
                    onTap: Get.back,
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Color(0xff713eff),
                    ),
                  ),
                  title: Text(
                    "비밀번호 찾기",
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  titleTextStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                  backgroundColor: Colors.white,
                  elevation: 0.0,
                )
              : null,
          body: Column(
            children: [
              _header(),
              _email(),
              _button(),
            ],
          )),
    );
  }

  Widget _header() => const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          "IDC에 가입했던 이메일을 입력해주세요. 비밀번호 재설정 이메일을 보내드립니다.",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
        ),
      );

  Widget _email() => const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: LoginTextField(
              hintText: "example@example.com",
            ),
          ),
        ],
      );

  Widget _button() => Padding(
        padding: const EdgeInsets.all(20.0),
        child: SignButton(
            width: double.infinity,
            height: 55,
            onPressed: () {},
            child: const Text(
              "비밀번호 찾기",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            )),
      );
}
