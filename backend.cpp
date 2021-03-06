#include "backend.hpp"

backend::backend(QObject *parent) : QObject(parent)
{
    storedConfigFilePath = QStandardPaths::writableLocation(QStandardPaths::GenericConfigLocation) + '/' + tempFolder;
    storedConfigFileFullPath = QStandardPaths::writableLocation(QStandardPaths::GenericConfigLocation) + '/' + tempFolder + '/' + storedConfig;


    //initialize settings and assign default values
    QSettings settings(storedConfigFileFullPath, QSettings::IniFormat);


    if(!settings.contains(res_key)){
        settings.setValue(res_key, res_def_value);
    }
    if(!settings.contains(store_backgrounds_key)){
        settings.setValue(store_backgrounds_key, store_backgrounds_def_value);
    }
    if(!settings.contains(store_backgrounds_path_key)){
        settings.setValue(store_backgrounds_path_key, store_backgrounds_path_def_value);
    }
    if(!settings.contains(download_cleaned_backgrounds_key)){
        settings.setValue(download_cleaned_backgrounds_key, download_cleaned_backgrounds_def_value );
    }
}


void backend::load(){
    QSettings settings(storedConfigFileFullPath, QSettings::IniFormat);

    myResolution = settings.value(res_key).toInt();



    if(settings.value(store_backgrounds_key).toString() == "true"){
        myStoreBackgrounds = true;
    }else if(settings.value(store_backgrounds_key).toString() == "false"){
        myStoreBackgrounds = false;
    }else{
        qCritical() << "store_backgrounds_key has an ilegal value";

    }


    myStoreBackgroundsPath = settings.value(store_backgrounds_path_key).toString();


    if(settings.value(download_cleaned_backgrounds_key).toString() == "true"){
        myStoreCleanedBackgrounds = true;
    }else if(settings.value(download_cleaned_backgrounds_key).toString() == "false"){
        myStoreCleanedBackgrounds = false;
    }else{
        qCritical() << "download_cleaned_backgrounds_key has an ilegal value";

    }
    qDebug()<< "LOADED";
    return;
}

void backend::save(){
    QSettings settings(storedConfigFileFullPath, QSettings::IniFormat);
    qDebug() << "myres"<< myResolution;
    if(myResolution < 5 || myResolution > 0){
        settings.setValue(res_key, QString::number(myResolution));

    }else{
        qCritical() << "myResolution has an ilegal value";

    }

    if(myStoreBackgrounds == true){
        settings.setValue(store_backgrounds_key, "true");
    }else if (myStoreBackgrounds == false){
        settings.setValue(store_backgrounds_key, "false");
    }else{
        qCritical() << "myStoreBackgrounds has an ilegal value";
    }

    if(!myStoreBackgroundsPath.isEmpty()){
        settings.setValue(store_backgrounds_path_key, myStoreBackgroundsPath);
    }else{
        qCritical() << "myStoreBackgroundsPath has an ilegal value";
    }

    if(myStoreCleanedBackgrounds == true){
        settings.setValue(download_cleaned_backgrounds_key, "true");
    }else if (myStoreCleanedBackgrounds == false){
        settings.setValue(download_cleaned_backgrounds_key, "false");
    }else{
        qCritical() << "myStoreCleanedBackgrounds has an ilegal value";
    }



    qDebug()<< "SAVED";
    return;
}
