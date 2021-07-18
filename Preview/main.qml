import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3
import Qt.labs.platform 1.1

import terka 1.0


Window {
	id: roots

	property int margin: 10

	function swap(width, height) {
		var pom = height
		height = width
		width = pom
	}

	//function
	//property bool thumbnail: false
	/*function hideHighlight() {
		//if (preview.miniatureIndex == -1) {
			//return
		//}
		//listView.itemAtIndex(preview.miniatureIndex).children[0].color = "transparent"
		//listView.itemAtIndex(preview.miniatureIndex).children[0].children[3].color = "transparent"
		sidebar.hideHighlight()
	}
	function showHighlight() {
		//listView.itemAtIndex(preview.miniatureIndex).children[0].color = "#434043"
		//listView.itemAtIndex(preview.miniatureIndex).children[0].children[3].color = "#214EB6"
		sidebar.showHighlight()
	}*/

	width: maximumWidth
	height: maximumHeight
	visible: true
	title: qsTr("Preview")
	color: "#282828"

	Preview {
		id: preview
	}
	FileImage {
		id: fileImage
	}

	Rectangle {
		id: mainWindow
		anchors.fill: parent
		states: [
			State {
				name: "detail"
				StateChangeScript {
					script: {
						barMenu.detailVisible();
						detail.visible = true;
						//sidebar.visible = false;
						sidebar.hideSidebar();
						sheet.visible = false;
					}
				}
			},
			State {
				name: "thumbnails"
				StateChangeScript {
					script: {
						barMenu.detailVisible();
						detail.visible = true;
						//sidebar.visible = true;
						sidebar.showSidebar();
						//sidebar.showMiniatures();
						sidebar.miniatureVisibility = true;
						sidebar.scrollbarSpacing = 30;
						sheet.visible = false;
					}
				}
			},
			State {
				name: "tableOfContents"
				StateChangeScript {
					script: {
						barMenu.detailVisible();
						detail.visible = true;
						//sidebar.visible = true;
						sidebar.showSidebar();
						//sidebar.hideMiniatures();
						sidebar.miniatureVisibility = false;
						sidebar.scrollbarSpacing = 5;
						sheet.visible = false;
					}
				}
			},
			State {
				name: "contactSheet"
				StateChangeScript {
					script: {
						barMenu.sheetVisible();
						detail.visible = false;
						//sidebar.visible = false;
						sidebar.hideSidebar();
						sheet.visible = true;
					}
				}
			}
		]

		FolderDialog {
			id: folderDialog
			options: FolderDialog.ReadOnly
			onAccepted: {
				preview.setDirPath(folder)
			}
		}
		Sidebar {
			id: sidebar
			height: parent.height
		}

		ColumnLayout {
			Layout.preferredHeight: parent.height
			anchors.left: sidebar.right
			anchors.right: parent.right
			spacing: 0
			MenuLayout {
				id: barMenu
				Layout.fillWidth: true
				onDetailChanged: mainWindow.state = "detail"
				onThumbnailsChanged: mainWindow.state = "thumbnails"
				onTableOfContentsChanged: mainWindow.state = "tableOfContents"
				onContactSheetChanged: mainWindow.state = "contactSheet"
				onRotateLeftChanged: detail.rotateLeft()
				onRotateRightChanged: detail.rotateRight()
				z: detail.z + 1
			}
			Detail {
				id: detail
				Layout.fillHeight: true
				Layout.fillWidth: true
				Layout.preferredWidth: parent.Layout.preferredWidth
				Layout.preferredHeight: parent.Layout.preferredHeight - barMenu.Layout.preferredHeight
				onImageNameChanged: barMenu.setImageName(name)
			}
			Sheet {
				id: sheet
				Layout.fillHeight: true
				Layout.fillWidth: true
				Layout.preferredWidth: parent.Layout.preferredWidth
				Layout.preferredHeight: parent.Layout.preferredHeight - barMenu.Layout.preferredHeight
				visible: false
			}
		}
	}
}

