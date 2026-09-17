import QtQuick 2.0;
import calamares.slideshow 1.0;

Presentation {
    id: presentation

    function nextSlide() {
        presentation.goToNextSlide();
    }

    Timer {
        id: advanceTimer
        interval: 12000
        running: presentation.activatedInCalamares
        repeat: true
        onTriggered: nextSlide()
    }

    Slide {
        Rectangle {
            anchors.fill: parent
            color: "#0d1526"
        }
        Text {
            anchors.centerIn: parent
            width: parent.width * 0.8
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WordWrap
            color: "#ffffff"
            font.pixelSize: 22
            text: "Bienvenido a Meridian OS\n\n" +
                  "Estamos preparando tu equipo. La instalación toma unos minutos."
        }
    }

    Slide {
        Rectangle {
            anchors.fill: parent
            color: "#0d1526"
        }
        Text {
            anchors.centerIn: parent
            width: parent.width * 0.8
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WordWrap
            color: "#ffffff"
            font.pixelSize: 20
            text: "Todo listo para trabajar\n\n" +
                  "LibreOffice, Thunderbird y Firefox vienen instalados.\n" +
                  "Sin configuración adicional."
        }
    }

    Slide {
        Rectangle {
            anchors.fill: parent
            color: "#0d1526"
        }
        Text {
            anchors.centerIn: parent
            width: parent.width * 0.8
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WordWrap
            color: "#ffffff"
            font.pixelSize: 20
            text: "Seguro desde el primer día\n\n" +
                  "KeePassXC para tus contraseñas y Remmina para conectarte\n" +
                  "a escritorios remotos de forma segura."
        }
    }

    function onActivate() { }
    function onLeave() { }
}
