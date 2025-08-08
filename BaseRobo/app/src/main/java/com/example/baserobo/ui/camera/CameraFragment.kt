package com.example.baserobo.ui.camera

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import com.example.baserobo.databinding.FragmentCameraBinding
import org.qtproject.qt.android.QtQuickView
import org.qtproject.example.RobotApp.RobotContent.App

class CameraFragment : Fragment() {

    private var _binding: FragmentCameraBinding? = null
    private val binding get() = _binding!!

    private lateinit var qtView: QtQuickView

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        _binding = FragmentCameraBinding.inflate(inflater, container, false)

        // 1) Create the QtQuickView
        qtView = QtQuickView(requireActivity())

        // 2) Instantiate the QML root
        val qmlRoot = App()

        // 3) Load QML content
        qtView.loadContent(qmlRoot)

        // 4) Inject into your FrameLayout
        binding.cameraQmlFrame.addView(
            qtView,
            ViewGroup.LayoutParams.MATCH_PARENT,
            ViewGroup.LayoutParams.MATCH_PARENT
        )

        return binding.root
    }

    override fun onResume() {
        super.onResume()
        // Activate the camera when fragment is visible
        qtView.setProperty("cameraActive", true)
    }

    override fun onPause() {
        // Deactivate the camera before fragment is hidden
        qtView.setProperty("cameraActive", false)
        super.onPause()
    }

    override fun onDestroyView() {
        // Remove the QtQuickView so it can be garbage-collected
        binding.cameraQmlFrame.removeView(qtView)
        _binding = null
        super.onDestroyView()
    }
}
