import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3

Rectangle {
	id: root

	// property alias imageName: imageName.text

	function setImageName(name) {
		imageName.text = name
	}

	// stavy detail, sheet
	// popr staci nastavit parentovi v layoutu (mainLayout)
	function detailVisible() {
		openFolder.visible =  true
		viewMenu.visible = true
		imageName.visible = true
		zoomOut.visible = true
		zoomIn.visible = true
		rotateLeft.visible = true
		rotateRight.visible = true
		loupe.visible = true
		stateB.visible = false
	}
	function sheetVisible() {
		//openFolder.visible =  false
		//viewMenu.visible = false
		//imageName.visible = false
		zoomOut.visible = false
		zoomIn.visible = false
		rotateLeft.visible = false
		rotateRight.visible = false
		loupe.visible = false
		stateB.visible = true
	}

	//signal changeState()
	signal thumbnailsChanged()
	signal detailChanged()
	signal tableOfContentsChanged()
	signal contactSheetChanged()
	signal rotateLeftChanged()
	signal rotateRightChanged()

	Layout.fillWidth: true
	Layout.alignment: Qt.AlignTop
	Layout.preferredHeight: 50
	color: "#3B383B"
	RowLayout {
		id: mainLayout
		layoutDirection: Qt.LeftToRight
		Layout.preferredWidth: parent.Layout.preferredWidth
		Layout.preferredHeight: parent.Layout.preferredHeight
		spacing: 0
		/*Text {
			Layout.fillWidth: true
			Layout.preferredHeight: parent.height
			text: folderDialog.folder
		}*/
		Button {
			id: openFolder
			Layout.preferredHeight: parent.Layout.preferredHeight
			text: "Open"
			onClicked: folderDialog.open()
		}
		Button {
			id: viewMenu
			Layout.preferredHeight: mainLayout.Layout.preferredHeight
			text: "View"
			onClicked: menu.open()
			Menu {
				id: menu
				MenuItem {
					text: "Hide Sidebar"
					onTriggered: detailChanged()
				}
				MenuItem {
					text: "Thumbnails"
					onTriggered: thumbnailsChanged()
				}
				MenuItem {
					text: "Table of Contents"
					onTriggered: tableOfContentsChanged()
				}
				MenuItem {
					id: m
					text: "Contact Sheet"
					onTriggered: contactSheetChanged()
				}
			}
		}
		Button {
			Layout.preferredHeight: parent.Layout.preferredHeight
			Item {
				//anchors.fill: parent
				//anchors.horizontalCenter: Qt.AlignHCenter
				Layout.alignment: Qt.AlignHCenter
				Text {
					id: imageName
					text: "fileName"
				}
				Text {
					text: "abc"
					anchors.top: imageName.bottom
				}
			}
		}
		Button {
			id: zoomOut
			Layout.preferredHeight: parent.Layout.preferredHeight
			text: "Zoom -"
			MouseArea {
				anchors.fill: parent
			}
		}
		Button {
			id: zoomIn
			Layout.preferredHeight: parent.Layout.preferredHeight
			text: "Zoom +"
		}
		Button {
			id: rotateLeft
			Layout.preferredHeight: parent.Layout.preferredHeight
			text: "RotateLeft"
			MouseArea {
				anchors.fill: parent
				onClicked: {
					rotateLeftChanged()
				}
			}
		}
		Button {
			id: rotateRight
			Layout.preferredHeight: parent.Layout.preferredHeight
			text: "RotateRight"
			MouseArea {
				anchors.fill: parent
				onClicked: {
					rotateRightChanged()
				}
			}
		}
		Button {
			id: loupe
			Layout.preferredHeight: parent.Layout.preferredHeight
			text: "Loupe"
			MouseArea {
				id: l
				anchors.fill: parent
			}
		}
		Button {
			id: stateB
			visible: false
			Layout.preferredHeight: parent.Layout.preferredHeight
			text: "StateB"
		}
	}
}
