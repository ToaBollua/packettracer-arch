# Maintainer: Jules
pkgname=packettracer
pkgver=8.2.2
pkgrel=1
pkgdesc="A cross-platform visual simulation tool designed by Cisco Systems that allows users to create network topologies and imitate modern computer networks."
arch=('x86_64')
url="https://www.netacad.com/resources/lab-downloads"
license=('custom:LicenseRef-Cisco-EULA')
depends=('qt5-base' 'qt5-multimedia' 'qt5-script' 'qt5-svg' 'qt5-webengine' 'qt5-websockets' 'qt5-x11extras' 'nss' 'libx11' 'libxext' 'libxss' 'libxtst' 'glibc')
makedepends=('binutils' 'tar')
options=('!strip' '!emptydirs')
install=packettracer.install
source=("local://CiscoPacketTracer_${pkgver}_Ubuntu_64bit.deb"
        'packettracer.sh'
        'packettracer.desktop')
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

package() {
    # DEBs are extracted by makepkg automatically if in sources.
    # Standard makepkg extracts deb to control and data tarballs,
    # and then might extract data.tar.* depending on configuration.
    # To be safe, we extract it manually:

    cd "${srcdir}"

    # Check if data.tar.xz or data.tar.gz exists
    if [ -f data.tar.xz ]; then
        tar -xf data.tar.xz -C "${pkgdir}"
    elif [ -f data.tar.gz ]; then
        tar -xf data.tar.gz -C "${pkgdir}"
    fi

    # Fix ownership
    chown -R root:root "${pkgdir}"

    # Setup directory structure properly if they end up in /opt/pt
    if [ -d "${pkgdir}/opt/pt" ]; then
        # Create standard bin directory
        install -d "${pkgdir}/usr/bin"
        install -d "${pkgdir}/usr/share/applications"
        install -d "${pkgdir}/usr/share/pixmaps"

        # Install launcher script
        install -Dm755 "${srcdir}/packettracer.sh" "${pkgdir}/usr/bin/packettracer"

        # Symlink to /usr/bin/pt for convenience
        ln -sf /usr/bin/packettracer "${pkgdir}/usr/bin/pt"

        # Install desktop entry
        install -Dm644 "${srcdir}/packettracer.desktop" "${pkgdir}/usr/share/applications/packettracer.desktop"

        # Optional: icons if provided in deb
        if [ -f "${pkgdir}/opt/pt/art/app.png" ]; then
            install -Dm644 "${pkgdir}/opt/pt/art/app.png" "${pkgdir}/usr/share/pixmaps/packettracer.png"
        fi

        # EULA
        if [ -f "${pkgdir}/opt/pt/eula.txt" ]; then
            install -Dm644 "${pkgdir}/opt/pt/eula.txt" "${pkgdir}/usr/share/licenses/${pkgname}/eula.txt"
        fi
    fi
}
