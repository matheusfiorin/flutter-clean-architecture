#!/usr/bin/env bash

cd local_packages

cd domain/models
flutter pub get
cd ../..

cd domain/data
flutter pub get
cd ../..

cd common
flutter pub get
cd ..

cd common_flutter
flutter pub get
cd ..

cd platform
flutter pub get
cd ..

cd data_sources
flutter pub get
cd ..

cd repositories
flutter pub get
cd ..

cd presentation
flutter pub get
cd ../..

flutter pub get
