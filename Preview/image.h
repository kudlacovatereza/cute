#ifndef IMAGE_H
#define IMAGE_H

#include <QObject>
#include <QString>
#include <QUrl>

class FileImage
		: public QObject
{
	Q_OBJECT
	Q_PROPERTY(QString fileName READ fileName NOTIFY fileNameChanged)
	Q_PROPERTY(QString fileSource READ fileSource NOTIFY fileSourceChanged)
	Q_PROPERTY(int displayedFileWidth READ displayedFileWidth NOTIFY displayedFileWidthChanged)
	Q_PROPERTY(int displayedFileHeight READ displayedFileHeight NOTIFY displayedFileHeightChanged)
	Q_PROPERTY(bool selected READ selected WRITE setSelected NOTIFY selectedChanged)

public:
	explicit FileImage(QObject* parent = nullptr);
	explicit FileImage(QString source, QString fileName, int fileWidth, int fileHeight, QObject* parent = nullptr);
	FileImage& operator=(FileImage* fileImage);
	static void registerQML();
	QString fileSource() const;
	QString fileName() const;
	int displayedFileWidth() const;
	int displayedFileHeight() const;
	int fileWidth() const;
	int fileHeight() const;
	//void setDisplayedFileWidth(int width);
	//void setDisplayedFileHeight(int height);
	void setThumbnailMiniatureFitSize();
	void displayedFileWidthAndHeightChanged();

	bool selected() const
	{
		return m_selected;
	}

public slots:
	void setSelected(bool selected)
	{
		if (m_selected == selected)
			return;

		m_selected = selected;
		emit selectedChanged(m_selected);
	}

signals:
	void fileNameChanged(QString fileName);
	void fileSourceChanged(QString source);
	void displayedFileWidthChanged();
	void displayedFileHeightChanged();

	void selectedChanged(bool selected);

private:
	QString m_fileSource;
	QString m_fileName;
	int m_fileWidth;
	int m_fileHeight;
	int m_displayedFileWidth = 0;
	int m_displayedFileHeight = 0;
	bool m_selected;
};

#endif // IMAGE_H
