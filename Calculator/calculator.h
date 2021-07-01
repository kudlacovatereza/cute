#ifndef CALCULATOR_H
#define CALCULATOR_H

#include <QObject>
#include <QString>
#include <iostream>

class Calculator
		: public QObject
{
	Q_OBJECT
	Q_PROPERTY(QString pressedButton READ pressedButton WRITE setpressedButton NOTIFY pressedButtonChanged)
	Q_PROPERTY(QString displayed READ displayed WRITE setDisplayed NOTIFY displayedChanged)
	Q_PROPERTY(QString symbol READ symbol WRITE setsymbol NOTIFY symbolChanged)

public:
	explicit Calculator(QObject *parent = nullptr);
	static void registerQML();
	QString pressedButton() const {
		return m_pressedButton;
	}
	QString displayed() const {
		return m_displayed;
	}
	QString symbol() const
	{
		return m_symbol;
	}
	//Q_INVOKABLE QString fun() {return "";}
	void addToNumber(int number) {
		if (m_pointPosition != 1) {
			if (m_number < 0) {
				m_number -= (number * m_pointPosition);
			}
			else {
				m_number += (number * m_pointPosition);
			}
			m_pointPosition /= 10;
		}
		else {
			m_number *= 10;
			if (m_number < 0) {
				m_number -= number;
			}
			else {
				m_number += number;
			}
		}
		m_displayed = QString::number(m_number);
		emit displayedChanged(m_displayed);
	}
	void addSymbol(QString symbol) {
		m_symbol = symbol;
		if (symbolPressed) {
			return;
		}
		symbolPressed = true;
		m_prevNumber = m_number;
		m_number = 0;
		m_pointPosition = 1;
		m_displayed = QString::number(m_number);
		emit displayedChanged(m_displayed);
	}
	void addPointToNumber() {
		if (m_pointPosition != 1) {
			return;
		}
		m_displayed += ".";
		m_pointPosition /= 10;
		emit displayedChanged(m_displayed);
	}
	void countResult() {
		if (m_symbol == "") {
			//blik
		}
		if (m_symbol == "÷") {
			m_number = m_prevNumber / m_number;
		}
		if (m_symbol == "×") {
			m_number = m_prevNumber * m_number;
		}
		if (m_symbol == "-") {
			m_number = m_prevNumber - m_number;
		}
		if (m_symbol == "+") {
			m_number = m_prevNumber + m_number;
		}
		m_prevNumber = 0;
		m_symbol = "";
		m_pointPosition = 1;
		symbolPressed = false;
		m_displayed = QString::number(m_number);
		emit displayedChanged(m_displayed);
	}
	void percent() {
		if (m_symbol != "") {
			return;
		}
		m_number /= 100;
		m_pointPosition /= 100;
		symbolPressed = false;
		m_displayed = QString::number(m_number);
		emit displayedChanged(m_displayed);
	}
	void changeSign() {
		if (m_number == 0) {
			return;
		}
		m_number *= -1;
		symbolPressed = false;
		m_displayed = QString::number(m_number);
		emit displayedChanged(m_displayed);
	}
	void clear() {
		if (m_symbol != "" && m_number == 0) {
			m_symbol = "";
			symbolPressed = false;
			m_number = m_prevNumber;
			m_prevNumber = 0;
		}
		else {
			m_number = 0;
		}
		m_displayed = QString::number(m_number);
		emit displayedChanged(m_displayed);
	}
	void appendPressedButton() {
		if (m_pressedButton == "0") {
			addToNumber(0);
		}
		if (m_pressedButton == "1") {
			addToNumber(1);
		}
		if (m_pressedButton == "2") {
			addToNumber(2);
		}
		if (m_pressedButton == "3") {
			addToNumber(3);
		}
		if (m_pressedButton == "4") {
			addToNumber(4);
		}
		if (m_pressedButton == "5") {
			addToNumber(5);
		}
		if (m_pressedButton == "6") {
			addToNumber(6);
		}
		if (m_pressedButton == "7") {
			addToNumber(7);
		}
		if (m_pressedButton == "8") {
			addToNumber(8);
		}
		if (m_pressedButton == "9") {
			addToNumber(9);
		}
		if (m_pressedButton == ",") {
			addPointToNumber();
		}
		if (m_pressedButton == "÷") {
			addSymbol("÷");
		}
		if (m_pressedButton == "×") {
			addSymbol("×");
		}
		if (m_pressedButton == "-") {
			addSymbol("-");
		}
		if (m_pressedButton == "+") {
			addSymbol("+");
		}
		if (m_pressedButton == "=") {
			countResult();
		}
		if (m_pressedButton == "%") {
			percent();
		}
		if (m_pressedButton == "+/-") {
			changeSign();
		}
		if (m_pressedButton == "C") {
			clear();
		}
		std::cout << m_number << std::endl;
	}


public slots:
	void setpressedButton(QString pressedButton) {
		m_pressedButton = pressedButton;
		appendPressedButton();
		emit pressedButtonChanged(m_pressedButton);
	}
	void setDisplayed(QString displayed)
	{
		if (m_displayed == displayed)
			return;

		m_displayed = displayed;
		emit displayedChanged(m_displayed);
	}
	void setsymbol(QString symbol) {
		if (m_symbol == symbol) {
			return;
		}
		m_symbol = symbol;
		emit symbolChanged(m_symbol);
	}

signals:
	void pressedButtonChanged(QString pressedButton);
	void displayedChanged(QString displayed);
	void symbolChanged(QString symbol);

private:
	QString m_pressedButton = "0";
	qreal m_prevNumber;
	qreal m_number;
	QString m_symbol;
	bool symbolPressed = false;
	//qreal m_answer;
	QString m_displayed = "0";
	qreal m_pointPosition = 1;
	int i = 0;

};

#endif // CALCULATOR_H
