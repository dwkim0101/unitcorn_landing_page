part of '../env.dart';

class NavigationFooter extends StatelessWidget {
  const NavigationFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: context.theme.copyWith(
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: context.color.surface.withOpacity(0.15),
        ),
      ),
      child: Container(
        color: context.color.onSurface,
        padding: const EdgeInsets.all(Constants.spacing),
        constraints: BoxConstraints(minWidth: context.width),
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.spaceAround,
          children: [
            // Navigation Logo
            NavigationHeader.logo(),

            // Menu list
            Padding(
              padding: const EdgeInsets.all(Constants.spacing),
              child: Wrap(
                alignment: WrapAlignment.center,
                children: [
                  // Term of Service Button
                  Semantics(
                    label: 'Unidentified Route',
                    link: true,
                    child: Seo.link(
                      anchor: 'Term of Service',
                      href: '/term_of_service.txt',
                      child: DButton.text(
                        onTap: () => context.go('/term_of_service.txt'),
                        text: 'Term of Service',
                        style: context.text.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: context.color.primary,
                        ),
                        color: Colors.transparent,
                      ),
                    ),
                  ),

                  // Privacy Pplicy Button
                  Semantics(
                    label: 'Sponsor Us',
                    link: true,
                    child: Seo.link(
                      anchor: 'Privacy Policy',
                      href: 'https://www.buymeacoffee.com/nialixus',
                      child: DButton.text(
                        onTap: () => launchUrl(
                            Uri.parse('https://www.buymeacoffee.com/nialixus')),
                        text: 'Privacy Policy',
                        style: context.text.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: context.color.primary,
                        ),
                        color: Colors.transparent,
                      ),
                    ),
                  ),

                  // Blog Button
                  Semantics(
                    label: 'Github Repository',
                    link: true,
                    child: Seo.link(
                      anchor: 'Instagram',
                      href: 'https://www.instagram.com/unitcon.official',
                      child: DButton.text(
                        onTap: () => launchUrl(
                          Uri.parse(
                              'https://www.instagram.com/unitcon.official'),
                        ),
                        text: 'Instagram',
                        style: context.text.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: context.color.primary,
                        ),
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Copyright text
            Semantics(
              label: 'Copyright 2024 Daniel Kim',
              child: Seo.link(
                anchor: '© 2024 Daniel Kim',
                href: 'https://github.com/dwkim0101/'
                    'unitcorn_landing_page',
                child: DButton.text(
                  mainAxisSize: MainAxisSize.min,
                  text: "© 2024 Daniel Kim",
                  style: context.text.bodyMedium?.copyWith(
                    color: context.color.surface.withOpacity(0.25),
                    fontWeight: FontWeight.w400,
                    fontSize: 11.0,
                  ),
                  textAlign: TextAlign.center,
                  color: Colors.transparent,
                  onTap: () => launchUrl(
                    Uri.parse(
                      'https://github.com/dwkim0101/'
                      'unitcorn_landing_page',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
