import QtQuick
import QtQuick.Controls 2.15
import "PageCreationScript.js" as PageCreator

Window {
    id: mainWindow
    width: 640
    height: 480
    visible: true
    title: qsTr("Homework 5 part 2")
    color: "#e5ecef"

    Auth{
        id: authWindow
        onAuth_destroyed: print("daff")
    }

    Button{
        id: pageCreationBtn
        anchors.centerIn: parent
        onClicked: PageCreator.createNewPage(mainWindow)
        text: qsTr("Create a window")
        background: Rectangle{
            anchors.fill: parent
            color: parent.down? "green" : (parent.hovered? "#d6d6d6" : "#f6f6f6")
        }
    }
    Button{
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: pageCreationBtn.bottom
        anchors.topMargin: 10
        onClicked: close()
        text: qsTr("Quit application")
        background: Rectangle{
            anchors.fill: parent
            color: parent.down? "green" : (parent.hovered? "#d6d6d6" : "#f6f6f6")
        }
    }


    Label{
        anchors.bottom: pageCreationBtn.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottomMargin: 10
        width: parent.width / 2
        wrapMode: Text.WordWrap
        horizontalAlignment: Text.AlignHCenter
        text: qsTr("If you want to create a new window <b>dynamically " +
                   "using JavaScript</b> then click a button below")

        background:
            Rectangle{
            anchors.fill: parent
            gradient: Gradient{
                GradientStop{ position: 0.0; color: "red" }
                GradientStop{ position: 0.7; color: "gold" }
                GradientStop{ position: 1.0; color: "silver" }
            }
        }
    }
}
