#include "calculator.h"
#include <QQmlEngine>

Calculator::Calculator(QObject *parent)
	: QObject(parent)
{

}

void Calculator::registerQML() {
	qmlRegisterType<Calculator>("terka", 1,0, "Calculator");
}
