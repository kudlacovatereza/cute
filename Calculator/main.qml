import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.5
import QtQml 2.15


import terka 1.0

Window {
	id: root
	height: 300
	width: 250
	visible: true
	title: qsTr("Calculator")
	opacity: 0.95

	Calculator{
		id: calc
	}

	Rectangle {
		anchors.fill: parent
		color: "black"
		Column {
			anchors.fill: parent
			spacing: 1
			Rectangle {
				id: re
				height: root.height / 6
				width: root.width
				color: "#252528"
				Text {
					id: txt
					text: calc.displayed
					anchors.fill: parent
					anchors.rightMargin: 10
					font.pixelSize: parent.height / 2
					horizontalAlignment: Text.AlignRight
					verticalAlignment: Text.AlignVCenter
					color: "white"
				}
			}
			Row {
				spacing: 1
				CalButton {
					id: a
					height: (root.height - (5 * parent.spacing)) / 6
					width: (root.width - (3 * parent.spacing)) / 4
					normalColor: "#404044"
					hoverColor: "#2f2f33"
					pressedColor: "#8b8b92"
					symbol: 'C'
					onPressed: {
						//calc.setpressedButton(symbol)
						calc.pressedButton = symbol
						divided.setBorders()
						times.setBorders()
						minus.setBorders()
						plus.setBorders()
					}
				}
				CalButton {
					height: (root.height - (5 * parent.spacing)) / 6
					width: (root.width - (3 * parent.spacing)) / 4
					normalColor: "#404044"
					hoverColor: "#2f2f33"
					pressedColor: "#8b8b92"
					symbol: '+/-'
					onPressed: {
						calc.pressedButton = symbol
						divided.setBorders()
						times.setBorders()
						minus.setBorders()
						plus.setBorders()
					}
				}
				CalButton {
					height: (root.height - (5 * parent.spacing)) / 6
					width: (root.width - (3 * parent.spacing)) / 4
					normalColor: "#404044"
					hoverColor: "#2f2f33"
					pressedColor: "#8b8b92"
					symbol: '%'
					onPressed: {
						calc.pressedButton = symbol
						divided.setBorders()
						times.setBorders()
						minus.setBorders()
						plus.setBorders()
					}
				}
				CalButton {
					id: divided
					height: (root.height - (5 * parent.spacing)) / 6
					width: (root.width - (3 * parent.spacing)) / 4
					normalColor: "#fcaf31"
					hoverColor: "#d08304"
					pressedColor: "#fdc160"
					symbol: '÷'
					onPressed: {
						calc.pressedButton = symbol
						divided.setBorders()
						times.setBorders()
						minus.setBorders()
						plus.setBorders()
					}
				}
			}
			Row {
				spacing: 1
				CalButton {
					height: (root.height - (5 * parent.spacing)) / 6
					width: (root.width - (3 * parent.spacing)) / 4
					normalColor: "#59595e"
					hoverColor: "#46464a"
					pressedColor: "#8b8b92"
					symbol: '7'
					onPressed: {
						calc.setpressedButton(symbol)
					}
				}
				CalButton {
					height: (root.height - (5 * parent.spacing)) / 6
					width: (root.width - (3 * parent.spacing)) / 4
					normalColor: "#59595e"
					hoverColor: "#46464a"
					pressedColor: "#8b8b92"
					symbol: '8'
					onPressed: {
						calc.pressedButton = symbol
					}
				}
				CalButton {
					height: (root.height - (5 * parent.spacing)) / 6
					width: (root.width - (3 * parent.spacing)) / 4
					normalColor: "#59595e"
					hoverColor: "#46464a"
					pressedColor: "#8b8b92"
					symbol: '9'
					onPressed: {
						calc.pressedButton = symbol
					}
				}
				CalButton {
					id: times
					height: (root.height - (5 * parent.spacing)) / 6
					width: (root.width - (3 * parent.spacing)) / 4
					normalColor: "#fcaf31"
					hoverColor: "#d08304"
					pressedColor: "#fdc160"
					symbol: '×'
					onPressed: {
						calc.pressedButton = symbol
						divided.setBorders()
						times.setBorders()
						minus.setBorders()
						plus.setBorders()
					}
				}
			}
			Row {
				spacing: 1
				CalButton {
					height: (root.height - (5 * parent.spacing)) / 6
					width: (root.width - (3 * parent.spacing)) / 4
					normalColor: "#59595e"
					hoverColor: "#46464a"
					pressedColor: "#8b8b92"
					symbol: '4'
					onPressed: {
						calc.pressedButton = symbol
					}
				}
				CalButton {
					height: (root.height - (5 * parent.spacing)) / 6
					width: (root.width - (3 * parent.spacing)) / 4
					normalColor: "#59595e"
					hoverColor: "#46464a"
					pressedColor: "#8b8b92"
					symbol: '5'
					onPressed: {
						calc.pressedButton = symbol
					}
				}
				CalButton {
					height: (root.height - (5 * parent.spacing)) / 6
					width: (root.width - (3 * parent.spacing)) / 4
					normalColor: "#59595e"
					hoverColor: "#46464a"
					pressedColor: "#8b8b92"
					symbol: '6'
					onPressed: {
						calc.pressedButton = symbol
					}
				}
				CalButton {
					id: minus
					height: (root.height - (5 * parent.spacing)) / 6
					width: (root.width - (3 * parent.spacing)) / 4
					normalColor: "#fcaf31"
					hoverColor: "#d08304"
					pressedColor: "#fdc160"
					symbol: '-'
					onPressed: {
						calc.pressedButton = symbol
						divided.setBorders()
						times.setBorders()
						minus.setBorders()
						plus.setBorders()
					}
				}
			}
			Row {
				spacing: 1
				CalButton {
					height: (root.height - (5 * parent.spacing)) / 6
					width: (root.width - (3 * parent.spacing)) / 4
					normalColor: "#59595e"
					hoverColor: "#46464a"
					pressedColor: "#8b8b92"
					symbol: '1'
					onPressed: {
						calc.pressedButton = symbol
					}
				}
				CalButton {
					height: (root.height - (5 * parent.spacing)) / 6
					width: (root.width - (3 * parent.spacing)) / 4
					normalColor: "#59595e"
					hoverColor: "#46464a"
					pressedColor: "#8b8b92"
					symbol: '2'
					onPressed: {
						calc.pressedButton = symbol
					}
				}
				CalButton {
					height: (root.height - (5 * parent.spacing)) / 6
					width: (root.width - (3 * parent.spacing)) / 4
					normalColor: "#59595e"
					hoverColor: "#46464a"
					pressedColor: "#8b8b92"
					symbol: '3'
					onPressed: {
						calc.pressedButton = symbol
					}
				}
				CalButton {
					id: plus
					height: (root.height - (5 * parent.spacing)) / 6
					width: (root.width - (3 * parent.spacing)) / 4
					normalColor: "#fcaf31"
					hoverColor: "#d08304"
					pressedColor: "#fdc160"
					symbol: '+'
					onPressed: {
						calc.pressedButton = symbol
						divided.setBorders()
						times.setBorders()
						minus.setBorders()
						plus.setBorders()
					}
				}
			}
			Row {
				spacing: 1
				CalButton {
					height: (root.height - (5 * parent.spacing)) / 6
					width: (root.width - (1 * parent.spacing)) / 2
					normalColor: "#59595e"
					hoverColor: "#46464a"
					pressedColor: "#8b8b92"
					symbol: '0'
					onPressed: {
						calc.pressedButton = symbol
					}
				}
				CalButton {
					height: (root.height - (5 * parent.spacing)) / 6
					width: (root.width - (3 * parent.spacing)) / 4
					normalColor: "#59595e"
					hoverColor: "#46464a"
					pressedColor: "#8b8b92"
					symbol: ','
					onPressed: {
						calc.pressedButton = symbol;
					}
				}
				CalButton {
					height: (root.height - (5 * parent.spacing)) / 6
					width: (root.width - (3 * parent.spacing)) / 4
					normalColor: "#fcaf31"
					hoverColor: "#d08304"
					pressedColor: "#fdc160"
					symbol: '='
					onPressed: {
						calc.pressedButton = symbol;
						divided.setBorders()
						times.setBorders()
						minus.setBorders()
						plus.setBorders()
					}
				}
			}
		}
	}
}
