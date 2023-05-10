#!/bin/bash

echo "Flutter Build Script"

read -p "Do you want to open the output folder? [y/N] " openFolder
if [[ "$openFolder" =~ ^([yY][eE][sS]|[yY])+$ ]]
then
    open build/app/outputs/flutter-apk/
fi

read -p "Please enter version name [default: 1.0.0]: " versionName
versionName=${versionName:-"1.0.0"} # Default version name is 1.0.0

read -p "Please enter version code [default: 1]: " versionCode
versionCode=${versionCode:-"1"} # Default version code is 1

devFileName=("lib/main_development.dart")

PS3='Do you want to build an apk or app bundle? Please enter your choice [default: APK]: '
options=("APK" "App Bundle" "Quit")
select opt in "${options[@]}"
do
    if [ -z "$opt" ]
    then
        opt="APK"
    fi
    case $opt in
        "APK"|"App Bundle")
            PS3='Do you want to build a development or product version? Please enter your choice [default: Development]: '
            versions=("Development" "Product" "Go Back")
            select ver in "${versions[@]}"
            do
                if [ -z "$ver" ]
                then
                    ver="Development"
                fi
                case $ver in
                    "Product")
                        echo "Building $opt in product mode... App version: $versionName, build number: $versionCode.."
                        if [ "$opt" = "APK" ]; then
                            flutter build apk --release --flavor product $devFileName -build-name=$versionName --build-number=$versionCode
                            mv build/app/outputs/flutter-apk/app-product-release.apk build/app/outputs/flutter-apk/product_${versionName}_${versionCode}.apk
                        else
                            flutter build appbundle --release --flavor product lib/main_product.dart --build-name=$versionName --build-number=$versionCode
                        fi
                        break 2
                        ;;
                    "Development")
                        echo "Building $opt in development mode... App version: $versionName, build number: $versionCode.."
                        if [ "$opt" = "APK" ]; then
                            flutter build apk --release --flavor development $devFileName --build-name=$versionName --build-number=$versionCode
                            mv build/app/outputs/flutter-apk/app-development-release.apk build/app/outputs/flutter-apk/product_${versionName}_${versionCode}.apk
                        else
                            flutter build appbundle --release --flavor development $devFileName --build-name=$versionName --build-number=$versionCode
                        fi
                        break 2
                        ;;
                    "Go Back")
                        break
                        ;;
                    *) echo "Invalid option $REPLY";;
                esac
            done
            ;;
        "Quit")
            break
            ;;
        *) echo "Invalid option $REPLY";;
    esac
done

read -p "Do you want to open the output folder? [y/N] " openFolder
if [[ "$openFolder" =~ ^([yY][eE][sS]|[yY])+$ ]]
then
    open build/app/outputs/flutter-apk/
fi