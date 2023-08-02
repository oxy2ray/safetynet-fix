package dev.kdrag0n.safetynetfix

import android.os.Build
import dev.kdrag0n.safetynetfix.logDebug

internal object InitSdk {
    fun init() {
        val patchedFirstApiLevel = Build.VERSION_CODES.O
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            logDebug("Patch DEVICE_INITIAL_SDK_INT prop. Set it to: $patchedFirstApiLevel")
            @Suppress("BlockedPrivateApi")
            Build.VERSION::class.java.getDeclaredField("DEVICE_INITIAL_SDK_INT").let { field ->
            field.isAccessible = true
            field.set(null, patchedFirstApiLevel)
            }
        }
    }
}
