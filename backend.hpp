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

    //for setting and readingresolution
    Q_PROPERTY(int resolution READ getResolution WRITE setResolution)

    //for setting and reading storeBackgrounds
    Q_PROPERTY(bool storeBackgrounds READ getStoreBackgrounds WRITE setStoreBackgrounds)

    //for setting and reading storedBackgroundsPath
    Q_PROPERTY(QString storedBackgroundsPath READ getStoredBackgroundsPath WRITE setStoredBackgroundsPath)

    //for setting and reading storedBackgroundsPath
    Q_PROPERTY(bool storeCleanedBackgrounds READ getStoreCleanedBackgrounds WRITE setStoreCleanedBackgrounds)





public:
    explicit backend(QObject *parent = nullptr);

    //test function
    Q_INVOKABLE void test(){
        qDebug()<< "BackEnd::test()";
    }



    //load function
    Q_INVOKABLE void load();

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
    void setStoreBackgrounds(bool storeBackgrounds){
        myStoreBackgrounds = storeBackgrounds;
    }

    QString getStoredBackgroundsPath(){
        return myStoreBackgroundsPath;
    }
    void setStoredBackgroundsPath(QString storeCleanedBackgrounds){
        myStoreBackgroundsPath = storeCleanedBackgrounds;
    }

    bool getStoreCleanedBackgrounds(){
        return myStoreCleanedBackgrounds;
    }
    void setStoreCleanedBackgrounds(bool storeBackgrounds){
        myStoreCleanedBackgrounds = storeBackgrounds;
    }



private:
    int myResolution = 5;
    bool myStoreBackgrounds = false;
    QString myStoreBackgroundsPath = "";
    bool myStoreCleanedBackgrounds = false;




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
    const QString download_cleaned_backgrounds_key = "download_cleaned_backgrounds";
    const QString download_cleaned_backgrounds_def_value = "false";





signals:

public slots:
};

#endif // BACKEND_H
