import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.15

Rectangle {
	id: root
	color: "grey"
	GridView {
		id: gridView
		height: parent.height
		width: 1200
		cellWidth: 300
		cellHeight: 300
		//anchors.fill: parent
		anchors.centerIn: parent
		anchors.margins: margin
		focus: true
		model: preview.list
		delegate: Item {
			width: gridView.cellWidth
			height: gridView.cellHeight
			//width: listView.width
			//focus: true
			//Layout.alignment: Qt.AlignCenter
			Rectangle {
				id: miniatureBackground
				width: miniature.width + 2 * margin
				height: miniature.height + 2 * margin
				anchors.margins: margin
				anchors.horizontalCenter: parent.horizontalCenter
				anchors.verticalCenter: parent.verticalCenter
				//Layout.alignment: Qt.AlignCenter
				//Layout.alignment: Qt.AlignCenter
				//color: "#434043"
				color: "transparent"
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
				}
			}
			Rectangle {
				id: miniatureNameBackground
				width: miniatureName.width + margin
				height: miniatureName.height
				//Layout.alignment: Qt.AlignCenter
				anchors.topMargin: 2
				anchors.top: miniatureBackground.bottom
				anchors.horizontalCenter: parent.horizontalCenter
				color: "transparent"
				//color: '#214EB6'
				radius: 5
				Text {
					id: miniatureName
					anchors.horizontalCenter: parent.horizontalCenter
					text: fileName
					color: 'white'
				}
			}
		}
	}
}
