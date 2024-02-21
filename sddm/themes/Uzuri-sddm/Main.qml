// Copyright 2022 Alexey Varfolomeev <varlesh@gmail.com>
// Used sources & ideas:
// - Joshua Krämer from https://github.com/joshuakraemer/sddm-theme-dialog
// - Suraj Mandal from https://github.com/surajmandalcell/Elegant-sddm
// - Breeze theme by KDE Visual Design Group
// - SDDM Team https://github.com/sddm/sddm
import QtQuick 2.8
import QtQuick.Controls 2.1
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.2
import org.kde.plasma.core 2.0 as PlasmaCore
import "components"

Rectangle {
    width: 640
    height: 480
    LayoutMirroring.enabled: Qt.locale().textDirection === Qt.RightToLeft
    LayoutMirroring.childrenInherit: true

    TextConstants {
        id: textConstants
    }

    // hack for disable autostart QtQuick.VirtualKeyboard
    Loader {
        id: inputPanel
        property bool keyboardActive: false
        source: "components/VirtualKeyboard.qml"
    }

    Connections {
        target: sddm
        onLoginSucceeded: {

        }
        onLoginFailed: {
            password.placeholderText = textConstants.loginFailed
            password.placeholderTextColor = "white"
            password.text = ""
            password.focus = true
            errorMsgContainer.visible = true
        }
    }

    Image {
        id: wallpaper
        anchors.fill: parent
        fillMode: Image.PreserveAspectCrop

        Binding on source {
            when: config.background !== undefined
            value: config.background
        }
    }
     StackView {
            id: mainStack
            anchors.centerIn: parent
            height: parent.height / 2
            width: parent.width / 3

            focus: true //StackView is an implicit focus scope, so we need to give this focus so the item inside will have it

            Timer {
                //SDDM has a bug in 0.13 where even though we set the focus on the right item within the window, the window doesn't have focus
                //it is fixed in 6d5b36b28907b16280ff78995fef764bb0c573db which will be 0.14
                //we need to call "window->activate()" *After* it's been shown. We can't control that in QML so we use a shoddy timer
                //it's been this way for all Plasma 5.x without a huge problem
                running: true
                repeat: false
                interval: 200
                onTriggered: mainStack.forceActiveFocus()
            }
                                   }
    DropShadow {
        anchors.fill: panel
        horizontalOffset: 0
        verticalOffset: 0
        radius: 0
        samples: 17
        color: "#70000000"
        source: panel
        }

Item {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 40
    Text {
        id: clock_h_d
        color: "white"
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        text: Qt.formatDateTime(new Date(), "hh:mm")
        font.bold: true
        font.pointSize: 40
    }
    Text {
id: clock_d_d
        color: "white"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 60
        text: Qt.formatDateTime(new Date(), "ddd d")
        font.bold: false
        font.pointSize: 12
        font.capitalization: Font.Capitalize
    }
}
ListModel {
    id: powerOff

    ListElement {
        name: "shutdown"

    }
    ListElement {
        name: "Restart"
    }
    ListElement {
        name: "Sleep"
    }
}
       Rectangle {
           id: background_PowerOfBoton
           anchors.bottom: parent.bottom
            anchors.right: parent.right
            anchors.bottomMargin: 15
            anchors.rightMargin: 15
            radius: 33
            color: "white"
            opacity: 0.3
            height: 33
            width: 33
       }
        Rectangle {
             anchors.bottom: parent.bottom
            anchors.right: parent.right
            anchors.bottomMargin: 15
            anchors.rightMargin: 15
            radius: 33
            color: "transparent"
            height: 33
            width: 33
            Row {

         ComboBox {
                    id: gtyu
                    height: 33
                    width: 33
                    model: powerOff
                    textRole: "name"
                    displayText: ""
                    currentIndex: powerOff.lastIndex
                    background: Rectangle {
                    implicitWidth: parent.width
                    implicitHeight: parent.height
                    color: "transparent"
                }

                    delegate: MenuItem {
                        id: menuitems
                        width: slistviewf.width * 4
                        text: gtyu.textRole ? (Array.isArray(gtyu.model) ? modelData[gtyu.textRole] : model[gtyu.textRole]) : modelData
                        highlighted: gtyu.highlightedIndex === index
                        hoverEnabled: gtyu.hoverEnabled
                        onClicked: {
                            gtyu.currentIndex = index
                            if (gtyu.currentText === "shutdown")
                            {
                                sddm.powerOff()
                            } else {
                                if (gtyu.currentText === "Restart")
                                {
                                    sddm.reboot()
                                } else
                                {
                                    if (gtyu.currentText === "Sleep")
                                    {
                                        sddm.suspend()
                                    }
                                }
                            }
                            gtyu.popup.close()
                        }
                    }
                    indicator: Rectangle{
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        height: parent.height
                        width: 20
                        color: "transparent"
                        Image{
                             anchors.verticalCenter: parent.verticalCenter
                            width: parent.width
                            height: width
                            fillMode: Image.PreserveAspectFit
                            source: "images/shutdown.svg"
                        }

                    }
                    popup: Popup {
                        width: 120
                        height: parent.height * menuitems.count
                        implicitHeight: slistviewf.contentHeight
                        rightMargin: 20
                        contentItem: ListView {
                            id: slistviewf
                            clip: true
                            anchors.fill: parent
                            model: gtyu.model
                            spacing: 0
                            highlightFollowsCurrentItem: true
                            currentIndex: gtyu.highlightedIndex
                            delegate: gtyu.delegate
                        }
                    }
                }
    }
}
    RowLayout {
        id: ntoolbarline
        anchors.fill: parent
       Rectangle {
           id: background_session
           Layout.preferredWidth: 100
           Layout.fillWidth: true
           Layout.minimumWidth: 100
           Layout.maximumWidth: session_text.implicitWidth + 45
           anchors.bottom: parent.bottom
            anchors.right: parent.right
            anchors.bottomMargin: 15
            anchors.rightMargin: background_PowerOfBoton.width +30
            radius: 33
            color: "white"
            opacity: 0.3
            height: 33
       }
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredWidth: 100
            Layout.minimumWidth: 100
            Layout.maximumWidth: session_text.implicitWidth + 45
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            anchors.bottomMargin: 15
            anchors.rightMargin: background_PowerOfBoton.width +30
            radius: 33
            color: "transparent"
            height: 33
            Row {
             anchors.left: parent.left
             anchors.leftMargin: 8
             anchors.verticalCenter: parent.verticalCenter
         ComboBox {
                    id: session
                    height: 20
                    width: 150
                    model: sessionModel
                    textRole: "name"
                    displayText: ""
                    currentIndex: sessionModel.lastIndex
                    background: Rectangle {
                    implicitWidth: parent.width
                    implicitHeight: parent.height
                    color: "transparent"
                }
                 contentItem: Text {
                     id: session_text
                       text: session.currentText
                       color: "white"
                       font.pointSize: 10
                       font.weight: Font.DemiBold
                       verticalAlignment: Text.AlignVCenter
                       horizontalAlignment: Text.AlignLeft
                 }
                    delegate: MenuItem {
                        id: menuitems
                        width: slistview.width * 4
                        text: session.textRole ? (Array.isArray(session.model) ? modelData[session.textRole] : model[session.textRole]) : modelData
                        highlighted: session.highlightedIndex === index
                        hoverEnabled: session.hoverEnabled
                        onClicked: {
                            session.currentIndex = index
                            slistview.currentIndex = index
                            session.popup.close()
                        }
                    }
                    indicator: Rectangle{
                        height: parent.height
                        anchors.left: parent.left
                        anchors.leftMargin: session_text.implicitWidth + 13
                        width: 20
                        color: "transparent"
                        Image{
                            anchors.verticalCenter: parent.verticalCenter
                            width: parent.width
                            height: width
                            fillMode: Image.PreserveAspectFit
                            source: "images/conf.svg"
                        }
                    }
                    popup: Popup {
                        width: parent.width
                        height: parent.height * menuitems.count
                        implicitHeight: slistview.contentHeight
                        margins: 0
                        contentItem: ListView {
                            id: slistview
                            clip: true
                            anchors.fill: parent
                            model: session.model
                            spacing: 0
                            highlightFollowsCurrentItem: true
                            currentIndex: session.highlightedIndex
                            delegate: session.delegate
                        }
                    }
                }
    }
    }
    }
    Item {
                    Rectangle {
                    color: "#181619"
                    radius: 13
                    opacity: 0.95
                    width: background_sessionrec.width
                    height: background_sessionrec.height
                    anchors.bottom: parent.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                 }

        width: dialog.width
        height: dialog.height
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        Rectangle {
            id: dialog
            color: "transparent"
            height: 230
            width: 400
        }

            Grid {
                anchors.fill: parent
                columns: 1
                spacing: 8
                verticalItemAlignment: Grid.AlignVCenter
                horizontalItemAlignment: Grid.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
                Rectangle {
                    id: background_sessionrec
                    color: "transparent"
                    radius: 13
                    width: password.implicitWidth + 16
                    height: (parent.height/3)*2
                    anchors.bottom: parent.bottom
                    anchors.horizontalCenter: parent.horizontalCenter

                Column {
                     anchors.horizontalCenter: parent.horizontalCenter
                     anchors.bottom: parent.bottom
                     anchors.bottomMargin: dialog.height - mask.height
                    Item {

                        Rectangle {
                            id: mask
                            width: 130
                            height: 130
                            radius: 17
                            visible: false
                        }

                        DropShadow {
                            anchors.fill: mask
                            width: mask.width
                            height: mask.height
                            horizontalOffset: 0
                            verticalOffset: 0
                            radius: 15.0
                            samples: 0
                            color: "#50000000"
                            source: mask
                        }
                    }

                    Image {
                        id: ava
                        width: 131
                        height: 131
                        opacity: 1
                        fillMode: Image.PreserveAspectCrop
                        layer.enabled: true
                        layer.effect: OpacityMask {
                            maskSource: mask
                        }
                        source: "/var/lib/AccountsService/icons/" + user.currentText
                        onStatusChanged: {
                            if (status == Image.Error)
                                return source = "images/.face.icon"
                        }
                    }
                }
                       Rectangle  {
            id: mask2
            width: background_sessionrec.width
            height: background_sessionrec.height
            radius: 13
            visible: false
                  }

                                      Rectangle {
            id: blurBg
            anchors.fill: parent
            anchors.centerIn: parent
            color: "transparent"
            opacity: 0.1
            z:-1
        }

Image {
    id: wallforblur
    width: background_sessionrec.width
    height: background_sessionrec.height
    fillMode: Image.PreserveAspectCrop
    layer.enabled: true
    layer.effect: OpacityMask {
     maskSource: mask2
                        }
                        source: wallpaper
}
        Rectangle {
            id: formBg
            width: background_sessionrec.width
            height: background_sessionrec.height
            x: (wallpaper.width-background_sessionrec.width)/2
            y: ((wallpaper.height-background_sessionrec.height)/2)+39
            radius: 12
            color: "transparent"
            opacity: 0.4
            z:-1
        }

        // Rectangle {
        //     id: footerBg
        //     width: parent.width
        //     height: footer.height + 10
        //     anchors.left: parent.left
        //     anchors.bottom: parent.bottom
        //     radius: 7
        //     color: "#2e3440"
        //     opacity: 0.5
        //     z:-1
        // }
        ShaderEffectSource {
            id: blurArea
            sourceItem: wallforblur
            width: blurBg.width
            height: blurBg.height
            anchors.centerIn: blurBg
            sourceRect: Qt.rect(formBg.x,formBg.y,width,height)
            visible: true
            z:-2
        }

        GaussianBlur {
            id: blur
            height: blurBg.height
            width: blurBg.width
            source: blurArea
            radius: 50
            samples: 50 * 2 + 1
            cached: true
            anchors.centerIn: blurBg
            visible: true
            z:-2
        }
                // Custom ComboBox for hack colors on DropDownMenu
                ComboBox {
                    id: user
                    height: 40
                    width: 226
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 48
                    anchors.horizontalCenter: parent.horizontalCenter
                    textRole: "name"
                    currentIndex: userModel.lastIndex
                    model: userModel

                     background: Rectangle {
                    implicitWidth: parent.width
                    implicitHeight: parent.height
                    Layout.alignment: Qt.AlignHCenter
                    color: "transparent"
                                   }
                      contentItem: Text {
                       id: txtuser
                       font.pointSize: 15
                       text: user.currentText
                       color: "white"
                       font.bold: true
                       anchors.horizontalCenter: parent.horizontalCenter
                       verticalAlignment: Text.AlignVCenter
                       horizontalAlignment: Text.AlignHCenter
                                              }
                    delegate: MenuItem {
                        font.bold: true
                        width: parent.width - 24
                        text: user.textRole ? (Array.isArray(
                                                   user.model) ? modelData[user.textRole] : model[user.textRole]) : modelData
                        highlighted: user.highlightedIndex === index
                        hoverEnabled: user.hoverEnabled
                        onClicked: {
                            user.currentIndex = index
                            ulistview.currentIndex = index
                            user.popup.close()
                            ava.source = "/var/lib/AccountsService/icons/" + user.currentText
                        }
                    }

                      indicator: Rectangle{
                        anchors.left: parent.left
                        anchors.leftMargin: user.width/2 + txtuser.implicitWidth/2 + 4
                        height: parent.height
                        width: 24
                        color: "transparent"
                        Image{
                            anchors.verticalCenter: parent.verticalCenter
                            width: parent.width
                            height: width
                            fillMode: Image.PreserveAspectFit
                            source: "images/go-down.svg"
                        }
                    }

                    popup: Popup {
                        width: parent.width
                        height: parent.height * parent.count
                        implicitHeight: ulistview.contentHeight
                        margins: 0
                        contentItem: ListView {
                            id: ulistview
                            clip: true
                            anchors.fill: parent
                            model: user.model
                            spacing: 0
                            highlightFollowsCurrentItem: true
                            currentIndex: user.highlightedIndex
                            delegate: user.delegate
                        }
                    }
                }

                TextField {
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 10
                    id: password
                    height: 32
                    width: 250
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: "#fff"
                    echoMode: TextInput.Password
                    focus: true
                    font.weight: Font.DemiBold
                    placeholderText: textConstants.password
                    onAccepted: sddm.login(user.currentText, password.text,
                                           session.currentIndex)

                    background: Rectangle {
                    implicitWidth: parent.width
                    implicitHeight: parent.height
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: "#fff"
                    opacity: 0.1
                    border.color: "#d4ffff"
                    border.width: 2
                    radius: 7
                    }
                    Rectangle {
                    implicitWidth: parent.width +3
                    implicitHeight: parent.height +3
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: "transparent"
                    opacity: 0.3
                    border.color: "#cb6c3c"
                    border.width: 2
                    radius: 7
                    }

                    Image {
                        id: caps
                        width: 24
                        height: 24
                        opacity: 0
                        state: keyboard.capsLock ? "activated" : ""
                        anchors.right: password.right
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.rightMargin: 10
                        fillMode: Image.PreserveAspectFit
                        source: "images/capslock.svg"
                        sourceSize.width: 24
                        sourceSize.height: 24

                        states: [
                            State {
                                name: "activated"
                                PropertyChanges {
                                    target: caps
                                    opacity: 1
                                }
                            },
                            State {
                                name: ""
                                PropertyChanges {
                                    target: caps
                                    opacity: 0
                                }
                            }
                        ]

                        transitions: [
                            Transition {
                                to: "activated"
                                NumberAnimation {
                                    target: caps
                                    property: "opacity"
                                    from: 0
                                    to: 1
                                    duration: imageFadeIn
                                }
                            },

                            Transition {
                                to: ""
                                NumberAnimation {
                                    target: caps
                                    property: "opacity"
                                    from: 1
                                    to: 0
                                    duration: imageFadeOut
                                }
                            }
                        ]
                    }
                }
                Rectangle {
                    color: "#cb6c3c"
                    width: 44
                    height: 44
                    radius: 100
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: -53
                    anchors.horizontalCenter: parent.horizontalCenter
                    Image {
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    width: 30
                    height: 30
                    source: "images/loginGo.svg"
                    }
                    MouseArea {
                    anchors.fill: parent
                    onClicked: { sddm.login(user.currentText, password.text, session.currentIndex) }
                              }
                          }
                }
                Keys.onPressed: {
                    if (event.key === Qt.Key_Return
                            || event.key === Qt.Key_Enter) {
                        sddm.login(user.currentText, password.text,
                                   session.currentIndex)
                        event.accepted = true
                    }
                }

                // Custom ComboBox for hack colors on DropDownMenu

            }

    }
}
