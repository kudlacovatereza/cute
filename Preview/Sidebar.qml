import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.15

Rectangle {
	id: root
	property bool miniatureVisibility: true
	property int scrollbarSpacing: 30

	function hideSidebar() {
		root.width = 0
		//.visible = false
	}
	function showSidebar() {
		root.width = 400
		//.visible = true
	}
	function hideHighlight() {
		if (preview.miniatureIndex == -1) {
			return
		}
		listView.itemAtIndex(preview.miniatureIndex).children[1].color = "transparent"
		listView.itemAtIndex(preview.miniatureIndex).children[0].color = "transparent"
	}
	function showHighlight() {
		listView.itemAtIndex(preview.miniatureIndex).children[1].color = "#214EB6"
		listView.itemAtIndex(preview.miniatureIndex).children[0].color = "#434043"
	}
	function rotateMiniatureLeft() {
		console.log("rotateMiniatureLeft")
		listView.itemAtIndex(preview.miniatureIndex).left()
	}
	function rotateMiniatureRight() {
		console.log("rotateMiniatureRight")
		listView.itemAtIndex(preview.miniatureIndex).right()
	}

	width: 400
	height: parent.height
	color: "#2B292B"
	ScrollView {
		anchors.fill: parent
		ScrollBar.vertical.policy: ScrollBar.AlwaysOn
		ListView {
			id: listView
			anchors.fill: parent
			anchors.margins: margin
			spacing: scrollbarSpacing
			focus: true
			orientation: Qt.Vertical
			model: preview.list
			delegate: ColumnLayout {
				width: listView.width
				focus: true
				Rectangle {
					id: miniatureBackground
					width: miniature.width + 2 * margin
					height: miniature.height + 2 * margin
					anchors.margins: margin
					Layout.alignment: Qt.AlignHCenter
					//color: "#434043"
					color: "transparent"
					visible: miniatureVisibility
					radius: 5
					Rectangle {
						id: mask
						width: displayedFileWidth
						height: displayedFileHeight
						radius: 5
						clip: true
						smooth: true
						visible: false
					}
					Image {
						id: miniature
						width: displayedFileWidth
						height: displayedFileHeight
						source: fileSource
						smooth: true
						visible: false
						anchors.horizontalCenter: parent.horizontalCenter
						anchors.verticalCenter: parent.verticalCenter
					}
					OpacityMask {
						id: opacityMask
						anchors.fill: miniature
						source: miniature
						maskSource: mask
						MouseArea {
							anchors.fill: parent
							onClicked: {
								hideHighlight()
								preview.setMiniatureIndex(index)
								detail.setImageSource(preview.detailImage.fileSource)
								detail.setAngle()
								barMenu.setImageName(fileName)
								showHighlight()
							}
						}
					}
				}
				Rectangle {
					id: miniatureNameBackground
					width: miniatureName.width + margin
					height: miniatureName.height
					Layout.alignment: Qt.AlignHCenter
					anchors.topMargin: 2
					color: "transparent"
					//color: '#214EB6'
					radius: 5
					Text {
						id: miniatureName
						anchors.horizontalCenter: parent.horizontalCenter
						text: fileName
						color: 'white'
					}
					MouseArea {
						anchors.fill: parent
						onClicked: {
							hideHighlight()
							preview.setMiniatureIndex(index)
							detail.setImageSource(preview.detailImage.fileSource)
							detail.setAngle(rotation.angle)
							barMenu.setImageName(fileName)
							showHighlight()
						}
					}
				}
			}
		}
	}
}
