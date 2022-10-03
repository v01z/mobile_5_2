import QtQuick
import QtQuick.Controls 2.15

Window{
    id: newWindow
    width: 640
    height: 480
    visible: true
    title: qsTr("Im a new window. Hello!")
    modality: Qt.ApplicationModal
    color: "#e5ecef"

    Label{
        id: lbl
        width: parent.width - 20
        height: width / 5
        anchors.centerIn: parent
        anchors.bottomMargin: 10
    }
    Button{
        text: qsTr("Back to main window")
        onClicked: {
            opacityAnimation.start()
        }
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: lbl.bottom
        anchors.topMargin: 10
        background: Rectangle{
            anchors.fill: parent
            color: parent.down? "green" : (parent.hovered? "#d6d6d6" : "#f6f6f6")
        }

    }
    PropertyAnimation{
        id: opacityAnimation
        targets: newWindow
        property: "opacity"
        to: 0
        duration: 400
        onFinished: newWindow.destroy()
    }
    Canvas{
        anchors.fill: lbl
        onPaint: {
            var ctx = getContext("2d")
            ctx.fillStyle = "Green"
            ctx.fillRect(0, 0, lbl.width, lbl.height)
            ctx.strokeStyle = "Red"
            ctx.shadowColor = "Red"
            ctx.shadowOffsetY = 5
            ctx.shadowBlur = 5
            ctx.font = "48px Arial"
            ctx.fillStyle = "Yellow"
            ctx.fillText("I'm a neborn window!", width/100*10, height/2)
        }
    }
}
