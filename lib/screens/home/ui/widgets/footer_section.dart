import 'package:ahsun_habib/app/widgets/section_padding.dart';
import 'package:flutter/material.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isMobile = width < 640;
    final isTablet = width >= 640 && width < 1008;

    final titleStyle = Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Colors.white,
          fontSize: isMobile ? 32 : (isTablet ? 45 : 60),
        );

    final double? containerHeight = isMobile ? null : (isTablet ? 450 : 500);

    return SectionPadding(
      topPadding: isMobile ? 40.0 : 100.0,
      bottomPadding: isMobile ? 40.0 : 100.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: isMobile ? 40 : 30),
          width: 1600,
          height: containerHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(
              image: AssetImage("assets/images/footer-banner.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: isMobile ? MainAxisAlignment.start : MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Let's Talk!",
                style: titleStyle,
              ),
              if (isMobile) const SizedBox(height: 30),
              isMobile
                  ? Column(
                      children: [
                        _buildContactItem(
                          context,
                          isMobile: true,
                          icon: Icons.phone_android_outlined,
                          title: "Phone Me",
                          description: "+8801308-166502",
                        ),
                        const SizedBox(height: 25),
                        _buildContactItem(
                          context,
                          isMobile: true,
                          icon: Icons.mail_outline_outlined,
                          title: "Mail Me",
                          description: "ahsunhabib96bd@gmail.com",
                        ),
                        const SizedBox(height: 25),
                        _buildContactItem(
                          context,
                          isMobile: true,
                          icon: Icons.face,
                          title: "Follow Me",
                          description: "/in/ahsunhabib/",
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _buildContactItem(
                          context,
                          isMobile: false,
                          icon: Icons.phone_android_outlined,
                          title: "Phone Me",
                          description: "+8801308-166502",
                        ),
                        _buildContactItem(
                          context,
                          isMobile: false,
                          icon: Icons.mail_outline_outlined,
                          title: "Mail Me",
                          description: "ahsunhabib96bd@gmail.com",
                        ),
                        _buildContactItem(
                          context,
                          isMobile: false,
                          icon: Icons.face,
                          title: "Follow Me",
                          description: "/in/ahsunhabib/",
                        )
                      ],
                    ),
              if (isMobile) const SizedBox(height: 35),
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
      ),
    );
  }

  Widget _buildContactItem(BuildContext context,
      {required bool isMobile, IconData? icon, String? title, String? description}) {
    final titleStyle = Theme.of(context).textTheme.bodySmall!.copyWith(
          color: Colors.white,
          fontSize: isMobile ? 16 : 20,
          fontWeight: FontWeight.bold,
        );
    final descStyle = Theme.of(context).textTheme.bodySmall!.copyWith(
          color: Colors.white,
          fontSize: isMobile ? 14 : 18,
        );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: Colors.teal,
          size: isMobile ? 30 : 40,
        ),
        const SizedBox(height: 10),
        Text(
          title!,
          style: titleStyle,
        ),
        const SizedBox(height: 10),
        Text(
          description!,
          style: descStyle,
        )
      ],
    );
  }
}
