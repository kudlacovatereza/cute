#include "image.h"
#include <QQmlEngine>
#include <QDebug>
#include <QtGlobal>

FileImage::FileImage(QObject* parent)
	: QObject(parent) {
}

FileImage::FileImage(QString source, QString fileName, int fileWidth, int fileHeight, QObject* parent)
	: QObject(parent)
	, m_fileSource(source)
	, m_fileName(fileName)
	, m_fileWidth(fileWidth)
	, m_fileHeight(fileHeight) {
	//m_displayedFileWidth = m_fileWidth;
	//m_displayedFileHeight = m_fileHeight;
}

FileImage& FileImage::operator=(FileImage* fileImage) {
	this->m_fileSource = fileImage->fileSource();
	this->m_fileName = fileImage->fileName();
	//this->m_fileHeight =
	return *this;
}

void FileImage::registerQML() {
	qmlRegisterType<FileImage>("terka", 1,0, "FileImage");
}

QString FileImage::fileSource() const {
	return this->m_fileSource;
}

QString FileImage::fileName() const {
	return this->m_fileName;
}

int FileImage::displayedFileWidth() const {
	return this->m_displayedFileWidth;
}

int FileImage::displayedFileHeight() const {
	return this->m_displayedFileHeight;
}

int FileImage::fileWidth() const {
	return this->m_fileWidth;
}

int FileImage::fileHeight() const {
	return this->m_fileHeight;
}

/*void FileImage::setDisplayedFileWidth(int width) {
	m_displayedFileWidth = width;
}

void FileImage::setDisplayedFileHeight(int height) {
	m_displayedFileHeight = height;
}*/

void FileImage::setThumbnailMiniatureFitSize() {
	/*qint16 a = (qint16)m_fileWidth;
	qint16 b = (qint16)m_fileHeight;
	qreal d = 380;
	qDebug() << a << ", " << b;
	qreal c = d / a;
	qDebug() << c << ":" << d;*/


	//qDebug() << "\n";
	//qDebug() << m_fileWidth << ", " << m_fileHeight;
	if (m_fileWidth < m_fileHeight) {
		//qDebug() << m_displayedFileWidth << ", " << m_displayedFileHeight << "\n";
		double finalHeight = 270;
		double proportion = finalHeight / m_fileHeight;
		m_displayedFileHeight = finalHeight;
		//qDebug() << proportion;
		m_displayedFileWidth = m_fileWidth * proportion;
		//qDebug() << m_displayedFileWidth << ", " << m_displayedFileHeight << "\n";
	}
	else {
		//qDebug() << m_displayedFileWidth << ", " << m_displayedFileHeight << "\n";
		double finalWidth = 360;
		double proportion = finalWidth / m_fileWidth;
		m_displayedFileWidth = finalWidth;
		//qDebug() << proportion;
		m_displayedFileHeight = m_fileHeight * proportion;
		//qDebug() << m_displayedFileWidth << ", " << m_displayedFileHeight << "\n";
	}
	emit displayedFileWidthChanged();
	emit displayedFileHeightChanged();
}
void FileImage::displayedFileWidthAndHeightChanged() {
	emit displayedFileWidthChanged();
	emit displayedFileHeightChanged();
}
