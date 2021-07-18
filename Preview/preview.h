#ifndef PREVIEW_H
#define PREVIEW_H

#include <QObject>
#include <QString>
#include <QUrl>
#include <QList>
#include <QQmlListProperty>

#include <image.h>


class Preview
		: public QObject {
	Q_OBJECT
	Q_PROPERTY(QUrl dirPath READ dirPath WRITE setDirPath NOTIFY dirPathChanged)
	Q_PROPERTY(QQmlListProperty<FileImage> list READ list NOTIFY listChanged)
	Q_PROPERTY(FileImage* detailImage READ detailImage NOTIFY detailImageChanged)
	Q_PROPERTY(int miniatureIndex READ miniatureIndex WRITE setMiniatureIndex NOTIFY miniatureIndexChanged)
	Q_PROPERTY(int listCount READ listCount NOTIFY listCountChanged)

	/*Q_CLASSINFO("DefaultProperty", "concepts")

	 Q_INVOKABLE void removeConcept(int index);
	 Q_INVOKABLE void addConcept(QString m_id,QString description, QString quantity, QString price, QString unit, QString total);

	 Q_INVOKABLE int countConcepts();

	 static void clearConcepts(QQmlListProperty<Concept> *property);
	 static int conceptsSize(QQmlListProperty<Concept> *property);
	 static Concept *conceptAt(QQmlListProperty<Concept> *property, int index);
	// Q_PROPERTY(QImage...)
	// Q_PORPERY width, height.. picoviny*/

public:
	explicit Preview(QObject *parent = nullptr);
	static void registerQML();
	QUrl dirPath() const;
	void loadImages();
	QQmlListProperty<FileImage> list();
	FileImage* detailImage() const;
	int miniatureIndex() const;
	void selectImage();
	int listCount() const;
	Q_INVOKABLE void incrementMiniatureIndex();
	Q_INVOKABLE void decrementMiniatureIndex();
	//Q_INVOKABLE void swapWidthAndHeight(int index);

	/*// qimage <- obrazek
	// dalsi tridu co bude mit list preview
	// qinvokable funkci co projde adresar a vytvori preview
	// qlist<preview>
	// Q_PROPERTY(QQmlListProperty<Preview> asdf READ ... WRITE ... NOTIFY)

	// QMultimedia - VideoOutput
	// QQuickImageProvider*/



public slots:
	void setDirPath(QUrl dirPath);
	void setMiniatureIndex(int miniatureIndex);

signals:
	void dirPathChanged(QUrl dirPath);
	void listChanged();
	void detailImageChanged(FileImage* detailImage);
	void miniatureIndexChanged(int miniatureIndex);
	void listCountChanged();

private:
	//static void appendList(QQmlListProperty<QImage> *list, QImage* image);

	QUrl m_dirPath;
	QList<FileImage*> m_list;
	FileImage* m_detailImage;
	int m_miniatureIndex;
	int m_listCount;
};


#endif // PREVIEW_H
