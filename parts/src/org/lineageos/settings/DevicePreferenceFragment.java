/*
 * Copyright (C) 2020 The LineageOS Project
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

package org.lineageos.settings;

import android.content.ContentResolver;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.os.RemoteException;
import android.os.ServiceManager;
import android.provider.Settings;

import androidx.preference.Preference;
import androidx.preference.PreferenceFragment;
import androidx.preference.SwitchPreference;

public class DevicePreferenceFragment extends PreferenceFragment {
    private static final String KEY_FORCE_60 = "pref_force_60";

    private SwitchPreference mPrefForce60Switch;

    private ContentResolver mContentResolver;

    @Override
    public void onActivityCreated(Bundle savedInstanceState) {
        super.onActivityCreated(savedInstanceState);
        mContentResolver = getActivity().getContentResolver();
        getActivity().getActionBar().setDisplayHomeAsUpEnabled(true);
    }

    @Override
    public void onCreatePreferences(Bundle savedInstanceState, String rootKey) {
        addPreferencesFromResource(R.xml.device_prefs);
        mPrefForce60Switch = (SwitchPreference) findPreference(KEY_FORCE_60);
        mPrefForce60Switch.setOnPreferenceChangeListener(PrefListener);
    }

    @Override
    public void onResume() {
        super.onResume();
        SharedPreferences sharedPref = getActivity().getSharedPreferences("parts_pref", Context.MODE_PRIVATE);
        mPrefForce60Switch.setChecked(sharedPref.getBoolean("force_60", false));
    }

    private final Preference.OnPreferenceChangeListener PrefListener =
            new Preference.OnPreferenceChangeListener() {
                @Override
                public boolean onPreferenceChange(Preference preference, Object value) {
                    final String key = preference.getKey();

                    if (KEY_FORCE_60.equals(key)) {
                        SharedPreferences sharedPref = getActivity().getSharedPreferences("parts_pref", Context.MODE_PRIVATE);
                        SharedPreferences.Editor editor = sharedPref.edit();

                        Settings.System.putFloat(mContentResolver, "peak_refresh_rate", (boolean) value ? 60f : 120f);
                        editor.putBoolean("force_60", (boolean) value);
                        editor.commit();
                    }
                    return true;
                }
            };
}
