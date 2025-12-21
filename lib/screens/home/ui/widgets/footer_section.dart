import 'package:ahsun_habib/app/widgets/section_padding.dart';
import 'package:flutter/material.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionPadding(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 30),
        width: 1600,
        height: 500,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage("assets/images/footer-banner.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Let's Talk!",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.white,
                  ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildContactItem(
                  context,
                  icon: Icons.phone_android_outlined,
                  title: "Phone Me",
                  description: "+8801308-166502",
                ),
                _buildContactItem(
                  context,
                  icon: Icons.mail_outline_outlined,
                  title: "Mail Me",
                  description: "ahsunhabib96bd@gmail.com",
                ),
                _buildContactItem(
                  context,
                  icon: Icons.face,
                  title: "Follow Me",
                  description: "/in/ahsunhabib/",
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 120,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)),
                      backgroundColor: Colors.teal,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {},
                    child: Text(
                      "Hire Me",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactItem(BuildContext context,
      {IconData? icon, String? title, String? description}) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.teal,
          size: 40,
        ),
        const SizedBox(height: 10),
        Text(
          title!,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Colors.white,
              ),
        ),
        const SizedBox(height: 10),
        Text(
          description!,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Colors.white,
              ),
        )
      ],
    );
  }
}
