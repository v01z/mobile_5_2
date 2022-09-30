import QtQuick
import QtQuick.Controls 2.15

Window{
    id: mainWindow
    width: 640
    height: 480
    visible: true
    title: qsTr("Login Form")
    color: "#e5ecef"
    modality: Qt.ApplicationModal

    property string login: "login"
    property string password: "password"
    signal auth_destroyed()

    function checkCredentials(){
        if(login === loginTextField.text && password === passwordTextField.text)
        {
            successAnimation.start()
        }
        else
            failAnimation.start()

    }


    Rectangle{
        id: secondaryFrame
        color: "white"
        anchors.centerIn: parent
        radius: 5
        width: 300
        height: 250

        property string textColor: "#535353"

        Column{
            anchors.fill: parent
            padding: 32
            spacing: 25

            TextField{
                id: loginTextField
                anchors.horizontalCenter: parent.horizontalCenter
                placeholderText: qsTr("Login")
                color: secondaryFrame.textColor
                width: parent.width - parent.padding*2
                font.pointSize: 10
                focus: true

                Keys.onEnterPressed: checkCredentials()
                Keys.onReturnPressed: checkCredentials()
            }
            TextField{
                id: passwordTextField
                echoMode: TextInput.Password
                anchors.horizontalCenter: parent.horizontalCenter
                placeholderText: qsTr("Password")
                color: secondaryFrame.textColor
                width: parent.width - parent.padding*2
                font.pointSize: 10
                Keys.onEnterPressed: checkCredentials()
                Keys.onReturnPressed: checkCredentials()

            }
            Button{
                id: submitButton
                width: parent.width - parent.padding*2
                height: 40
                background: Rectangle{
                    color: parent.down? "bbbbbb" : (parent.hovered? "#d6d6d6" : "#f6f6f6")
                }
                text: qsTr("Auth")
                anchors.horizontalCenter: parent.horizontalCenter

                onClicked: checkCredentials()
            }
        }
    }
    ParallelAnimation{
        id: failAnimation
        SequentialAnimation{
            PropertyAnimation{
                targets: [loginTextField, passwordTextField]
                property: "color"
                to: "dark red"
                duration: 0
            }
            PropertyAnimation{
                targets: [loginTextField, passwordTextField]
            }
        }
        SequentialAnimation{

            NumberAnimation {
                target: secondaryFrame
                property: "anchors.horizontalCenterOffset"
                to: -5
                duration: 50
            }
            NumberAnimation {
                target: secondaryFrame
                property: "anchors.horizontalCenterOffset"
                to: 5
                duration: 50
            }
            NumberAnimation {
                target: secondaryFrame
                property: "anchors.horizontalCenterOffset"
                to: 0
                duration: 50
            }

        }
    }

    SequentialAnimation{
        id: successAnimation
        onFinished: {
            auth_destroyed()
            mainWindow.destroy()
        }
        PropertyAnimation{
            targets: [loginTextField, passwordTextField]
            property: "opacity"
            to: 0
            duration: 400
        }
        PropertyAnimation{
            targets: secondaryFrame
            property: "opacity"
            to: 0
            duration: 600
        }


    }
}
