import 'package:easy_extension/easy_extension.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:news_portal/app/router/translations/app_trans.dart';
import 'package:news_portal/presentation/widgets/app_logo.dart';
import 'package:news_portal/presentation/widgets/app_scaffold.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    // 미리 선언
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // NOTE : 이메일, 패스워드 가져오기
  void _onLogin() {
    final email = _emailController.text;
    final password = _passwordController.text;

    debugPrint('이메일: $email');
    debugPrint('비밀번호: $password');
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            // #region 로고
            AppLogo(),
            // #region Text
            Container(
              height: 250,
              alignment: Alignment.center,
              child: Text(
                AppTrans.login.welcome.tr(),
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),

            // #region 이메일 입력
            _textField(
              controller: _emailController,
              hintText: AppTrans.login.email.tr(),
            ),
            // #region 패스워드 입력
            _textField(
              controller: _passwordController,
              hintText: AppTrans.login.password.tr(),
            ),
            ElevatedButton(
              onPressed: _onLogin,
              child: Text(AppTrans.login.login.tr()),
            ),
            //# region Or use 구분선
            Container(
              height: 70,
              alignment: Alignment.center,
              child: Row(
                spacing: 10,
                children: [
                  Expanded(child: Divider()),
                  Text(AppTrans.login.orUse.tr()),
                  Expanded(child: Divider()),
                ],
              ),
            ),
            // 구글 로그인
            _buildSsoButton('Google'),
            10.heightBox,

            // 애플 로그인
            _buildSsoButton('Apple'),
          ],
        ),
      ),
    );
  }

  OutlinedButton _buildSsoButton(String sso) {
    final logoUrl = {
      'Google':
          'https://api.apidog.com/api/v1/projects/866715/resources/354903/image-preview',
      'Apple':
          'https://api.apidog.com/api/v1/projects/866715/resources/354902/image-preview',
    };
    return OutlinedButton(
      onPressed: () {},
      child: Row(
        children: [
          Image.network(
            logoUrl[sso] ?? '',
            errorBuilder: (context, error, stackTrace) {
              return Icon(LucideIcons.x);
            },
          ),
          Expanded(
            child: Center(
              child: Text(
                AppTrans.login.signInWith.tr(namedArgs: {'sso': 'Google'}),
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextField _textField({
    required TextEditingController controller,
    required String hintText,
  }) {
    return TextField(
      controller: _emailController,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: hintText,
      ),
    );
  }
}
