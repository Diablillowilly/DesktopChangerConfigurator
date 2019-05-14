#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>
#include <QDebug>
#include <QStandardPaths>
#include <QFile>
#include <QDir>
#include <QSettings>

class backend : public QObject
{
    Q_OBJECT

    //for setting and reading pack name (pack folder name)
    Q_PROPERTY(int resolution READ getResolution WRITE setResolution)

    //for setting and reading pack description (for pack.mcmeta)
    Q_PROPERTY(bool storeBackgrounds READ getStoreBackgrounds WRITE seStoreBackgrounds)

    //for setting and reading pack format (for pack.mcmeta)
    Q_PROPERTY(QString storedBackgroundsPath READ getStoredBackgroundsPath WRITE setStoredBackgroundsPath)





public:
    explicit backend(QObject *parent = nullptr);

    //test function
    Q_INVOKABLE void test(){
       qDebug()<< "BackEnd::test()";
    }



    //save function
    Q_INVOKABLE void save();

    int getResolution(){
        return myResolution;
    }
    void setResolution(int new_resolution){
     myResolution = new_resolution;
    }

    bool getStoreBackgrounds(){
        return myStoreBackgrounds;
    }
    void seStoreBackgrounds(bool storeBackgrounds){
     myStoreBackgrounds = storeBackgrounds;
    }

    QString getStoredBackgroundsPath(){
        return myStoreBackgroundsPath;
    }
    void setStoredBackgroundsPath(QString storedBackgroundsPath){
     myStoreBackgroundsPath = storedBackgroundsPath;
    }


private:
    int myResolution = 5;
    bool myStoreBackgrounds = false;
    QString myStoreBackgroundsPath = "";




    const QString tempFolder = "Desktop Changer";

    const QString storedConfig = "config.txt";
    //path to folder containing file
    QString storedConfigFilePath;
    //path to file
    QString storedConfigFileFullPath;




    const QString res_key = "resolution";
    const QString res_def_value = "5";
    const QString store_backgrounds_key = "store_backgrounds";
    const QString store_backgrounds_def_value = "false";
    const QString store_backgrounds_path_key = "stored_backgrounds_path";
    const QString store_backgrounds_path_def_value = "";




signals:

public slots:
};

#endif // BACKEND_H
