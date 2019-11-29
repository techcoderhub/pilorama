import QtQuick 2.13
import QtQuick.Controls 2.13
import QtGraphicalEffects 1.12
import QtQuick.Layouts 1.1

import "Sequence"
import ".."


Item {
    id: sequence

    property bool blockEdits: globalTimer.running
    property bool showQueue: true

    function setCurrentItem(id){
        if(id === undefined){ id = -1 }
        sequenceView.currentIndex = id
    }

    Header {
        id: sequenceHeader
    }

    Rectangle {
        id: sequenceSetLayout
        color: colors.getColor("bg")
        anchors.top: sequenceHeader.bottom
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.topMargin: 0

        ListView {
            id: sequenceView
            anchors.fill: parent
            spacing: 0
            orientation: ListView.Vertical
            clip: true
            snapMode: ListView.SnapToItem
            footerPositioning: ListView.OverlayFooter
            currentIndex: -1

            property int itemWidth: width
            property int itemHeight: 38



            model: masterModel

            footer: Footer {
                id: sequenceFooter
                z: 2
            }

            delegate: Item {
                id: delegateItem

                width: sequenceView.itemWidth
                height: sequenceView.itemHeight

                SequenceItem {id: sequenceItem }

                DropArea {
                    anchors.fill: parent
                    keys: ["sequenceItems"]
                    onEntered: {
                        var draggedId = drag.source.dragItemIndex
                        masterModel.move(draggedId, index, 1)
                    }
                }
            }

            addDisplaced: Transition {
                NumberAnimation {properties: "x, y"; duration: 100}
            }
            moveDisplaced: Transition {
                NumberAnimation { properties: "x, y"; duration: 100 }
            }
            remove: Transition {
                NumberAnimation { properties: "x, y"; duration: 100 }
                NumberAnimation { properties: "opacity"; duration: 100}
            }

            removeDisplaced: Transition {
                NumberAnimation { properties: "x, y"; duration: 100 }
            }

            displaced: Transition {
                NumberAnimation {properties: "x, y"; duration: 100}
            }
        }
    }
}



/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/