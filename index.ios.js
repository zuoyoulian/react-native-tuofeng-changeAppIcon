import React from 'react';

import { NativeModules } from 'react-native';

const TFChangeAppIcon = NativeModules.TFChangeAppIcon;

export default class ChangeAppIcon {
    static changeAppIcon(info, callBack) {
        TFChangeAppIcon.changeAppIconWithInfo(info, (respone) => {
            callBack(respone);
        });
    }
}
