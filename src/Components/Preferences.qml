import QtQuick 2.0
import QtGraphicalEffects 1.12

import "Preferences"

Item {
    id: preferences
    visible: false

    property bool splitToSequence: false

    property int cellHeight: 38

    property int fontSize: 14
    property int infoFontSize: 12

    Header {
        id: prefsHeader
    }

    Column {

        id: prefs

        spacing: 0

        anchors.top: prefsHeader.bottom
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.left: parent.left

        anchors.topMargin: 7

        Item {
            id: splitToSequence
            height: preferences.cellHeight
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0

            Checkbox {
                id: splitToSequenceCheck
                checked: preferences.splitToSequence
            }

            Text {
                id: splitToSequenceLabel
                height: 19
                text: qsTr("Split timer to sequence")
                anchors.right: parent.right
                anchors.rightMargin: 0
                color: colors.getColor("dark")
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: splitToSequenceCheck.right
                anchors.leftMargin: 0
                font.pixelSize: fontSize

                renderType: Text.NativeRendering

            }


            MouseArea {
                id: splitToSequenceTrigger
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor

                onReleased: {
                    preferences.splitToSequence = !preferences.splitToSequence
                }
            }
        }

        Item {
            id: onTop
            height: preferences.cellHeight
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0

            Checkbox {
                id: onTopCheck
                checked: window.alwaysOnTop
            }

            Text {
                id: onTopLabel
                height: 19
                text: qsTr("Always on top")
                anchors.right: parent.right
                anchors.rightMargin: 0
                anchors.left: onTopCheck.right
                anchors.leftMargin: 0
                color: colors.getColor("dark")
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: fontSize

                renderType: Text.NativeRendering

            }


            MouseArea {
                id: onTopTrigger
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor

                onReleased: {
                    window.alwaysOnTop = !window.alwaysOnTop
                }
            }
        }

        Item {
            id: closeOnQuit
            height: preferences.cellHeight
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0

            Checkbox {
                id: closeOnQuitCheck
                checked: !window.quitOnClose
            }

            Text {
                id: closeOnQuitLabel
                height: 19
                text: qsTr("On close hide to system tray ")
                anchors.right: parent.right
                anchors.rightMargin: 0
                anchors.left: closeOnQuitCheck.right
                anchors.leftMargin: 0
                color: colors.getColor("dark")
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: fontSize

                renderType: Text.NativeRendering

            }


            MouseArea {
                id: closeOnQuitTrigger
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor

                onReleased: {
                    window.quitOnClose = !window.quitOnClose
                }
            }
        }

        Item {
            id: followSystemTheme
            height: preferences.cellHeight
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0

            Checkbox {
                id: followSystemThemeCheck
                checked: appSettings.followSystemTheme
            }

            Text {
                id: followSystemThemeLabel
                height: 19
                text: qsTr("Follow system color theme")
                anchors.right: parent.right
                anchors.rightMargin: 0
                anchors.left: followSystemThemeCheck.right
                anchors.leftMargin: 0
                color: colors.getColor("dark")
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: fontSize

                renderType: Text.NativeRendering

            }


            MouseArea {
                id: followSystemThemeTrigger
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor

                onReleased: {
                    appSettings.followSystemTheme = !appSettings.followSystemTheme
                }
            }
        }

    }

    Row {
        id: help
        height: 32
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 3
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 30

        Image {
            anchors.verticalCenter: parent.verticalCenter
            sourceSize.width: 23
            sourceSize.height: 23
            antialiasing: true
            smooth: true
            fillMode: Image.PreserveAspectFit

            source: "../assets/img/github.svg"

            ColorOverlay{
                anchors.fill: parent
                source: parent
                color: colors.getColor('mid')
                antialiasing: true
            }
        }

        Text {
            anchors.verticalCenter: parent.verticalCenter
            textFormat: Text.RichText;
            text:   "<style>a:link { color: " + colors.getColor('mid') + "; }</style>" +
                    "<a href='https://github.com/eplatonoff/pilorama'>project on github</a>"
            font.pixelSize: preferences.infoFontSize

            onLinkActivated: Qt.openUrlExternally(link)

        }
    }


}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:5;anchors_width:115}D{i:9;anchors_width:115}
}
##^##*/
