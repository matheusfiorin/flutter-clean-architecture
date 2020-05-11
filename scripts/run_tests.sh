#!/usr/bin/env bash

cd local_packages

cd repositories
pub run test
cd ..

cd presentation
flutter test
cd ../..

#flutter test
