import QtQuick 2.12
import QtQuick.Window 2.12

import QtQuick.Controls 2.3
import QtQuick.Dialogs 1.3
import QtQuick.Layouts 1.11

import MybackEnd 1.0


Window {
    id: window
    visible: true
    width: 640
    height: 480
    minimumWidth: 640
    minimumHeight: 400
    maximumWidth: 640
    maximumHeight: 400
    title: qsTr("Hello World")


    BackEnd{
        id:my_backEnd


    }

    Rectangle {
        id: rectangle_main
        color: "#ffffff"
        anchors.rightMargin: 3
        anchors.leftMargin: 3
        anchors.bottomMargin: 3
        anchors.topMargin: 3
        anchors.fill: parent
        border.width: 1

        Rectangle {
            id: rectangle_resolution
            height: 50
            color: "#ffffff"
            anchors.right: parent.right
            anchors.rightMargin: 2
            anchors.left: parent.left
            anchors.leftMargin: 2
            border.width: 1
            anchors.top: parent.top
            anchors.topMargin: 2

            Text {
                id: text_resolution
                width: 150
                text: qsTr("Resolution")
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.left: parent.left
                anchors.leftMargin: 0
                anchors.top: parent.top
                anchors.topMargin: 0
                font.pixelSize: 16

                Rectangle {
                    id: rectangle_text_resolution
                    height: parent.height - 4
                    width: parent.width - 4
                    z:-1
                    color: "#ffffff"
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    border.width: 1
                }
            }

            Rectangle {
                id: rectangle_comboBox_resolution
                height: 25
                color: "#ffffff"
                border.width: 1
                anchors.left: text_resolution.right
                anchors.leftMargin: 2
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 2
                anchors.top: parent.top
                anchors.topMargin: 2
                anchors.right: parent.right
                anchors.rightMargin: 2

                ComboBox {
                    id: comboBox_resolution
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: parent.width - 2
                    height: parent.height - 2
                    wheelEnabled: false
                    font.pointSize: 18
                    spacing: -1
                    textRole: "text"

                    background: Rectangle{
                        color: "#ffffff"

                    }










                    //probably should improve how this loads
                    model: ListModel {
                        id: resolution_list
                        ListElement { text: "1920 x 1080";  value: 5 }
                        ListElement { text: "1680 x 1050"; value: 4 }
                        ListElement { text: "1366 x 768";  value: 3 }
                        ListElement { text: "1280 x 800";  value: 2 }
                        ListElement { text: "1280 x 1024";  value: 1 }
                        ListElement { text: "1024 x 768";  value: 0 }
                    }
                }
            }

        }





        Rectangle {
            id: rectangle_store_backgrounds
            x: -6
            y: 7
            height: 50
            color: "#ffffff"
            anchors.rightMargin: 2
            anchors.topMargin: 2
            anchors.leftMargin: 2
            anchors.top: rectangle_resolution.bottom
            Text {
                id: text_store_backgrounds
                width: 150
                text: qsTr("Store backgrounds")
                anchors.topMargin: 0
                anchors.leftMargin: 0
                anchors.top: parent.top
                Rectangle {
                    id: rectangle_text_store_backgrounds
                    width: parent.width - 4
                    height: parent.height - 4
                    color: "#ffffff"
                    z: -1
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    border.width: 1
                }
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 16
                horizontalAlignment: Text.AlignHCenter
                anchors.bottomMargin: 0
            }

            CheckBox {
                id: checkBox_store_backgrounds
                text: qsTr("")
                tristate: false
                autoRepeat: false
                autoExclusive: false
                anchors.left: text_store_backgrounds.right
                anchors.leftMargin: 0
                anchors.top: parent.top
                anchors.topMargin: 0
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0
                anchors.right: parent.right
                anchors.rightMargin: 0

                onCheckStateChanged: {
                    button_select_path.flat = !checkBox_store_backgrounds.checked
                    button_select_path_background.color = checkBox_store_backgrounds.checked ? "lightgrey" : "white"
                }

                Rectangle {
                    id: rectangle_text_store_backgrounds1
                    color: "#ffffff"
                    anchors.rightMargin: 2
                    anchors.leftMargin: 2
                    anchors.bottomMargin: 2
                    anchors.topMargin: 2
                    anchors.fill: parent
                    z: -1
                    border.width: 1
                }
            }
            anchors.left: parent.left
            border.width: 1
            anchors.right: parent.right
        }

        Rectangle {
            id: rectangle_path_enabled
            height: 50
            color: "#ffffff"
            anchors.right: parent.right
            anchors.rightMargin: 2
            anchors.left: parent.left
            anchors.leftMargin: 2
            border.width: 1
            anchors.top: rectangle_store_backgrounds.bottom
            anchors.topMargin: 2

            Text {
                id: text_select_path
                width: 150
                text: qsTr("Backgrounds path")
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.left: parent.left
                anchors.leftMargin: 0
                anchors.top: parent.top
                anchors.topMargin: 0
                font.pixelSize: 16

                Rectangle {
                    id: rectangle_text_select_path
                    height: parent.height - 4
                    width: parent.width - 4
                    z:-1
                    color: "#ffffff"
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    border.width: 1
                }
            }

            Text {
                id: text_path_select_path
                text: qsTr("")
                anchors.right: rectangle_select_path_button.left
                anchors.rightMargin: 0
                anchors.topMargin: 0
                anchors.leftMargin: 0
                anchors.top: parent.top
                Rectangle {
                    id: rectangle_text_path_select_path
                    color: "#ffffff"
                    anchors.rightMargin: 2
                    anchors.leftMargin: 2
                    anchors.bottomMargin: 2
                    anchors.topMargin: 2
                    anchors.fill: parent
                    z: -1
                    border.width: 1
                }
                anchors.bottom: parent.bottom
                anchors.left: text_select_path.right
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 16
                horizontalAlignment: Text.AlignHCenter
                anchors.bottomMargin: 0
            }

            Rectangle {
                id: rectangle_select_path_button
                x: 9
                y: -3
                width: 75
                height: 25
                color: "#ffffff"
                anchors.rightMargin: 2
                anchors.topMargin: 2
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                border.width: 1
                anchors.right: parent.right
                anchors.bottomMargin: 2

                Button {
                    id: button_select_path
                    text: qsTr("Browse")
                    anchors.rightMargin: 2
                    anchors.leftMargin: 2
                    anchors.bottomMargin: 2
                    anchors.topMargin: 2
                    anchors.fill: parent
                    background: Rectangle {
                        id:button_select_path_background
                        radius: 3
                        color: "white"
                    }
                    onClicked: {
                        if(checkBox_store_backgrounds.checked){
                            fileDialog_browse_path.open();
                            button_select_path_background.color = "grey"
                            console.log(button_select_path.pressed)
                        }else{
                            button_select_path_background.color = "white"
                        }
                    }
                }
            }
        }

        Rectangle {
            id: rectangle
            color: "#ffffff"
            border.width: 1
            anchors.rightMargin: 2
            anchors.leftMargin: 2
            anchors.bottomMargin: 2
            anchors.top: rectangle_path_enabled.bottom
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.topMargin: 2

            Button {
                id: button
                text: qsTr("SAVE")
                font.pointSize: 20
                anchors.rightMargin: 2
                anchors.leftMargin: 2
                anchors.bottomMargin: 2
                anchors.topMargin: 2
                anchors.fill: parent

                onPressed: {
                    console.log("Saving")
                    console.log("Resolution: " + Math.abs(comboBox_resolution.currentIndex - 5))
                    console.log("storeBackgrounds: " + checkBox_store_backgrounds.checked)
                    console.log("storedBackgroundsPath: " + text_path_select_path.text)



                    if(checkBox_store_backgrounds.checked == true && text_path_select_path.text.length == 0){
                        msg_dialog_need_to_specify_path.open()
                    }else{
                        my_backEnd.resolution = Math.abs(comboBox_resolution.currentIndex - 5)
                        my_backEnd.storeBackgrounds = checkBox_store_backgrounds.checked
                        my_backEnd.storedBackgroundsPath = text_path_select_path.text
                        my_backEnd.save()
                        msg_dialog_saved.open()
                    }
                }


            }
        }
    }





    MessageDialog {
        id: msg_dialog_need_to_specify_path
        title: "WARNING"
        text: "You have to first choose a path"
        informativeText: "In order to know where to place textures,
      please choose a folder to store the downloaded backgrounds"
        icon:StandardIcon.Critical
    }
    MessageDialog {
        id: msg_dialog_saved

        title: "SAVED"
        text: "Saved"
        /*informativeText: "In order to know where to place textures,
        please choose a texture pack folder"*/
        icon:StandardIcon.Information
    }




    FileDialog {
        id: fileDialog_browse_path
        title: "Please choose a folder"
        //folder: shortcuts.pictures
        folder: shortcuts.pictures

        selectFolder : true
        onAccepted: {
            button_select_path_background.color = "lightgrey"
            //my_backEnd.packPath = fileDialog_texture_pack_path.fileUrls.toString()

            var result = fileDialog_browse_path.fileUrls.toString()
            result = result.substring(8, result.length)
            var max_width = 50

            if(result.length > max_width){
                result = result.substring(0,max_width) + "\n" + result.substring(max_width)
            }
            if(result.length > max_width*2){
                result = result.substring(0,max_width*2) + "\n" + result.substring(max_width*2)
            }

            text_path_select_path.text = result


        }
        onRejected:  {
            button_select_path_background.color = "lightgrey"

        }

    }



}


























/*##^## Designer {
    D{i:19;anchors_height:46;anchors_width:480}D{i:24;anchors_height:46;anchors_width:146}
D{i:23;anchors_width:150}D{i:26;anchors_x:"-152";anchors_y:"-2"}D{i:1;anchors_height:50;anchors_width:640}
}
 ##^##*/
