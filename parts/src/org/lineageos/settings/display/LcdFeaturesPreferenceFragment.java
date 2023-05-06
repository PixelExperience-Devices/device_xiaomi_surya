/*
 * Copyright (C) 2021 Paranoid Android
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

package org.lineageos.settings.display;

import android.content.Context;
import android.os.Bundle;
import android.os.SystemProperties;

import androidx.preference.ListPreference;
import androidx.preference.Preference;
import androidx.preference.PreferenceFragment;
import androidx.preference.SwitchPreference;

import org.lineageos.settings.R;
import org.lineageos.settings.utils.FileUtils;

public class LcdFeaturesPreferenceFragment extends PreferenceFragment
        implements Preference.OnPreferenceChangeListener {

    public static final String HBM_NODE = "/sys/devices/platform/soc/soc:qcom,dsi-display/hbm";
    public static final String CABC_NODE = "/sys/devices/platform/soc/soc:qcom,dsi-display/cabc";

    public static final String HBM_PROP = "persist.lcd.hbm_mode";
    public static final String CABC_PROP = "persist.lcd.cabc_mode";

    public static final int HBM_MODE_OFF = 0;
    public static final int HBM_MODE_ON = 2;

    private static final String KEY_HBM = "hbm_pref";
    private static final String KEY_CABC = "cabc_pref";

    private SwitchPreference mHbmPref;
    private ListPreference mCabcPref;

    @Override
    public void onActivityCreated(Bundle savedInstanceState) {
        super.onActivityCreated(savedInstanceState);
        getActivity().getActionBar().setDisplayHomeAsUpEnabled(true);
    }

    @Override
    public void onCreatePreferences(Bundle savedInstanceState, String rootKey) {
        addPreferencesFromResource(R.xml.lcd_features_settings);
        mHbmPref = (SwitchPreference) findPreference(KEY_HBM);
        mCabcPref = (ListPreference) findPreference(KEY_CABC);
        restorePreferenceState();
        mHbmPref.setOnPreferenceChangeListener(this);
        mCabcPref.setOnPreferenceChangeListener(this);
        validateKernelSupport();
    }

    @Override
    public void onResume() {
        super.onResume();
        restorePreferenceState();
        validateKernelSupport();
    }

    @Override
    public boolean onPreferenceChange(Preference preference, Object newValue) {
        final String key = preference.getKey();

        if (key.equals(KEY_HBM)) {
            boolean isHbmEnabled = (Boolean) newValue;
            mHbmPref.setChecked(isHbmEnabled);
            SystemProperties.set(HBM_PROP,
                String.valueOf(isHbmEnabled ? HBM_MODE_ON : HBM_MODE_OFF));
        } else if (key.equals(KEY_CABC)) {
            mCabcPref.setValue((String) newValue);
            mCabcPref.setSummary(mCabcPref.getEntry());
            SystemProperties.set(CABC_PROP, (String) newValue);
        }

        return true;
    }

    private void restorePreferenceState() {
        boolean isHbmEnabled = SystemProperties.getInt(HBM_PROP, HBM_MODE_OFF) > HBM_MODE_OFF;
        String activeCabc = SystemProperties.get(CABC_PROP, "0");
        mHbmPref.setChecked(isHbmEnabled);
        mCabcPref.setValue(activeCabc);
        mCabcPref.setSummary(mCabcPref.getEntry());
    }

    private void validateKernelSupport() {
        if (!FileUtils.fileExists(HBM_NODE)) {
            mHbmPref.setSummary(getResources().getString(R.string.kernel_not_supported));
            mHbmPref.setEnabled(false);
        }
        if (!FileUtils.fileExists(CABC_NODE)) {
            mCabcPref.setSummary(getResources().getString(R.string.kernel_not_supported));
            mCabcPref.setEnabled(false);
        }
    }
}
