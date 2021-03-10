/*
 * Copyright (C) 2020-2021 The LineageOS Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.lineageos.settings.utils;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Parcel;
import android.os.RemoteException;
import android.os.ServiceManager;
import org.lineageos.settings.utils.FileUtils;

public class RefreshRateUtils {
    private static final String SCHEDBOOST_PATH = "/dev/stune/top-app/schedtune.boost";
    private static final String SCHEDBOOST_VALUE_LOW = "5";
    private static final String SCHEDBOOST_VALUE_HIGH = "10";

    // All values over this are considered high and use SCHEDBOOST_VALUE_HIGH
    private static final int SCHEDBOOST_HIGH_THRESHOLD = 2;

    public static int getRefreshRate(Context context) {
        SharedPreferences sharedPref = context.getSharedPreferences("parts_pref", Context.MODE_PRIVATE);
        return sharedPref.getInt("refresh_rate", 3);
    }

    public static int getPowerSaveRefreshRate(Context context) {
        SharedPreferences sharedPref = context.getSharedPreferences("parts_pref", Context.MODE_PRIVATE);
        return sharedPref.getInt("power_save_refresh_rate", 2);
    }

    public static boolean getPowerSaveRefreshRateSwitch(Context context) {
        SharedPreferences sharedPref = context.getSharedPreferences("parts_pref", Context.MODE_PRIVATE);
        return sharedPref.getBoolean("power_save_refresh_rate_switch", true);
    }

    public static void setRefreshRate(Context context, int refreshRate) {
        SharedPreferences sharedPref = context.getSharedPreferences("parts_pref", Context.MODE_PRIVATE);
        SharedPreferences.Editor editor = sharedPref.edit();
        editor.putInt("refresh_rate", refreshRate);
        editor.commit();
    }

    public static void setPowerSaveRefreshRate(Context context, int refreshRate) {
        SharedPreferences sharedPref = context.getSharedPreferences("parts_pref", Context.MODE_PRIVATE);
        SharedPreferences.Editor editor = sharedPref.edit();
        editor.putInt("power_save_refresh_rate", refreshRate);
        editor.commit();
    }

    public static void setPowerSaveRefreshRateSwitch(Context context, boolean state) {
        SharedPreferences sharedPref = context.getSharedPreferences("parts_pref", Context.MODE_PRIVATE);
        SharedPreferences.Editor editor = sharedPref.edit();
        editor.putBoolean("power_save_refresh_rate_switch", state);
        editor.commit();
    }

    public static final void setFPS(int v) {
        /* Handle schedboost */
        FileUtils.writeLine(SCHEDBOOST_PATH, v > SCHEDBOOST_HIGH_THRESHOLD ? SCHEDBOOST_VALUE_HIGH : SCHEDBOOST_VALUE_LOW);

        Parcel data = Parcel.obtain();
        data.writeInterfaceToken("android.ui.ISurfaceComposer");
        data.writeInt(v);
        try {
            ServiceManager.getService("SurfaceFlinger").transact(1035, data, (Parcel) null, 0);
        } catch (RemoteException e) {
            // nothing we can do
        }
        data.recycle();
    }
}
