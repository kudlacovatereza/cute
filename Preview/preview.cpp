#include "preview.h"
#include <QQmlEngine>
#include <QDirIterator>
#include <QImage>
#include <QList>
#include <QQmlListProperty>


Preview::Preview(QObject *parent)
	: QObject(parent) {
	//connect(this, SIGNAL(dirPathChanged(QUrl)),
	//		this, SLOT(loadImages()));
}

void Preview::registerQML() {
	qmlRegisterType<Preview>("terka", 1,0, "Preview");
	FileImage::registerQML();
}

QUrl Preview::dirPath() const {
	return m_dirPath;
}

void Preview::setDirPath(QUrl dirPath) {
	if (m_dirPath == dirPath) {
		return;
	}
	m_dirPath = dirPath;
	loadImages();
	emit dirPathChanged(m_dirPath);
}

void Preview::loadImages() {
	QDirIterator imageFileIt(m_dirPath.path(), {"*.jpg", "*.jpeg", "*.png"}, QDir::Files);
	qDeleteAll(m_list);
	m_list.clear();
	while (imageFileIt.hasNext()) {
		QString filePath = imageFileIt.next();
		QImage qimage(filePath);
		FileImage* image = new FileImage("file://" + filePath, imageFileIt.fileName(), qimage.width(), qimage.height(), this);
		image->setThumbnailMiniatureFitSize();
		m_list.push_back(image);
	}
	//selectImage(0);
	m_listCount = m_list.count();
	m_miniatureIndex = -1;
	emit listCountChanged();
	emit listChanged();
}

QQmlListProperty<FileImage> Preview::list() {
	return QQmlListProperty<FileImage>(this, m_list);
}

FileImage* Preview::detailImage() const {
	return m_detailImage;
}

void Preview::selectImage(){
	Q_ASSERT(m_miniatureIndex >= 0 && m_miniatureIndex < m_list.size());
	m_detailImage = m_list.at(m_miniatureIndex);
	//m_detailImage->setDisplayedFileWidth(m_detailImage->fileWidth());
	//m_detailImage->setDisplayedFileHeight(m_detailImage->fileHeight());
	emit detailImageChanged(m_detailImage);
}

int Preview::miniatureIndex() const {
	return m_miniatureIndex;
}

void Preview::setMiniatureIndex(int miniatureIndex) {
	if (m_miniatureIndex == miniatureIndex) {
		return;
	}
	m_miniatureIndex = miniatureIndex;
	selectImage();
	emit miniatureIndexChanged(m_miniatureIndex);
}

void Preview::incrementMiniatureIndex() {
	if (m_miniatureIndex + 1 >= m_list.length() || m_miniatureIndex < 0) {
		return;
	}
	m_miniatureIndex++;
	selectImage();
	emit miniatureIndexChanged(m_miniatureIndex);
}

void Preview::decrementMiniatureIndex() {
	if (m_miniatureIndex - 1 < 0 || m_miniatureIndex >= m_list.length()) {
		return;
	}
	m_miniatureIndex--;
	selectImage();
	emit miniatureIndexChanged(m_miniatureIndex);
}

/*void Preview::swapWidthAndHeight(int index) {
	int pom = m_list.at(index)->displayedFileWidth();
	m_list.at(index)->setDisplayedFileWidth(m_list.at(index)->displayedFileHeight());
	m_list.at(index)->setDisplayedFileHeight(pom);
	m_list.at(index)->displayedFileWidthAndHeightChanged();
	m_list.at(index)->setThumbnailMiniatureFitSize();

}*/

int Preview::listCount() const {
	return m_listCount;
}
