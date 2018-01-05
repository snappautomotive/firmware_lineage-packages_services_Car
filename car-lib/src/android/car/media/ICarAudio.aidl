/*
 * Copyright (C) 2015 The Android Open Source Project
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

package android.car.media;

import android.car.media.CarAudioPatchHandle;
import android.media.AudioAttributes;
import android.media.IVolumeController;

/**
 * Binder interface for {@link android.car.media.CarAudioManager}.
 * Check {@link android.car.media.CarAudioManager} APIs for expected behavior of each call.
 *
 * @hide
 */
interface ICarAudio {
    AudioAttributes getAudioAttributesForCarUsage(int carUsage);

    void setUsageVolume(int carUsage, int index, int flags);
    void setVolumeController(IVolumeController controller);
    int getUsageMaxVolume(int carUsage);
    int getUsageMinVolume(int carUsage);
    int getUsageVolume(int carUsage);

    void setFadeTowardFront(float value);
    void setBalanceTowardRight(float value);

    String[] getExternalSources();
    CarAudioPatchHandle createAudioPatch(in String sourceName, int usage, int gainIndex);
    void releaseAudioPatch(in CarAudioPatchHandle patch);
}
