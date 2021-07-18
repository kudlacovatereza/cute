import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3

Rectangle {
	id: imageDetailBackground

	function setImageSource(source) {
		image.source = source
		console.log(source)
	}

	function rotateLeft() {
		console.log("rotateLeft")
		rotation.angle -= 90
	}

	function rotateRight() {
		console.log("rotateRight")
		rotation.angle += 90
	}

	function setAngle() {
		console.log("setAngle " + 0)
		rotation.angle = 0;
	}

	signal imageNameChanged(string name)

	color: "pink"
	Flickable {
		id: imageBackground
		//anchors.fill: parent
		//width: 1000
		//height: 1000
		/*Rectangle {
			anchors.fill: parent
			color: "blue"
		}*/

		width: !preview.detailImage ? 0 : preview.detailImage.displayedFileWidth;
		//width: preview.detailImage.displayedFileWidth
		//height: preview.detailImage.displayedFileHeight
		height: !preview.detailImage ? 0 : preview.detailImage.displayedFileHeight;
		z: parent.z
		transform: Rotation {
			id: rotation
				origin.x: imageBackground.width / 2
				origin.y: imageBackground.height / 2
			}
		Image {
			id: image
			anchors.fill: parent
			horizontalAlignment: Image.AlignHCenter
			verticalAlignment: Image.AlignVCenter
			fillMode: Image.PreserveAspectFit
			//transform: Rotation { origin.x: parent.width / 2; origin.y: parent.height / 2; angle: 90}

			MouseArea {
				anchors.fill: parent
				onWheel: {
					if(wheel.angleDelta > 0) {
						image.scale *= 1.1
					}else {
						image.scale *= 0.9
					}
				}
			}
		}
	}
	Rectangle {
		height: 50
		width: 50
		color: "black"
		anchors.verticalCenter: parent.verticalCenter
		anchors.left: parent.left
		MouseArea {
			anchors.fill: parent
			onClicked: {
				sidebar.hideHighlight()
				if (preview.miniatureIndex !== -1) {
					preview.decrementMiniatureIndex()
					image.source = preview.detailImage.fileSource
					//imageName.text = preview.detailImage.fileName
					imageNameChanged(preview.detailImage.fileName)
					sidebar.showHighlight()
				}
			}
		}
	}
	Rectangle {
		height: 50
		width: 50
		color: "black"
		anchors.verticalCenter: parent.verticalCenter
		anchors.right: parent.right
		MouseArea {
			anchors.fill: parent
			onClicked: {
				sidebar.hideHighlight()
				if (preview.miniatureIndex !== -1) {
					preview.incrementMiniatureIndex()
					image.source = preview.detailImage.fileSource
					//imageName.text = preview.detailImage.fileName
					imageNameChanged(preview.detailImage.fileName)
					sidebar.showHighlight()
				}
			}
		}
	}
}
