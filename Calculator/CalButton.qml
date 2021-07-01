import QtQuick 2.0

Item {
	id: root
	property color normalColor
	property color hoverColor
	property color pressedColor
	property string symbol

	signal pressed(string symbol)

	function setBorders() {
		rec.border.color = "black";
		if (symbol !== calc.symbol)
			rec.border.width = 0;
		else
			rec.border.width = 1;
	}

	Rectangle {
		id: rec
		height: parent.height
		width: parent.width
		color: normalColor
		Text {
			text: symbol
			anchors.fill: parent
			font.pixelSize: height / 2.5
			horizontalAlignment: Text.AlignHCenter
			verticalAlignment: Text.AlignVCenter
			color: "white"
		}
		MouseArea {
			anchors.fill: parent
			hoverEnabled: true
			onEntered: {
				parent.color = hoverColor
			}
			onPressed: {
				parent.color = pressedColor
				root.pressed(root.symbol)
			}
			onReleased: {
				parent.color = hoverColor
			}
			onExited: {
				parent.color = normalColor
			}
		}
	}
}
