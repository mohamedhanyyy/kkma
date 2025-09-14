import 'package:flutter/cupertino.dart';
import 'package:kkma/core/resources/colors.dart';

class SearchFailedWidget extends StatelessWidget {
  const SearchFailedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/searchfailed.png',width: 237,height: 192),
            const SizedBox(height: 48),
            const Text(
              'ما لقينا أي نتيجة',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            ),
            const SizedBox(height: 10),
            const Text('تأكد من كتابة اسم الصنف بشكل صحيح، أو جرّب كلمة مختلفة.',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: AppColors.secondaryText,
                ),
                textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
