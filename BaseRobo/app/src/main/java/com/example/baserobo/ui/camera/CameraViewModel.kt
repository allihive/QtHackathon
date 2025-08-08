//NotificationsViewModel
package com.example.baserobo.ui.camera

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel

class CameraViewModel : ViewModel() {
    // single LiveData holding our overlay message
    private val _message = MutableLiveData<String>().apply {
        value = "Smile for the flower! \uD83C\uDF38"
    }
    val message: LiveData<String> = _message
}