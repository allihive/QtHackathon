package com.example.baserobo.ui.camera

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.view.ViewGroup.LayoutParams.MATCH_PARENT
import androidx.fragment.app.Fragment
import com.example.baserobo.databinding.FragmentCameraBinding
import org.qtproject.example.RobotApp.RobotContent.App
import org.qtproject.qt.android.QtQuickView

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

        // 1) Create the Java QtQuickView
        qtView = QtQuickView(requireContext())

        // 2) Load your QML root object (the generated App() class)
        qtView.loadContent(App())

        // 3) Embed it straight into your FrameLayout
        binding.cameraQmlFrame.addView(qtView,
            ViewGroup.LayoutParams(MATCH_PARENT, MATCH_PARENT)
        )

        return binding.root
    }

    override fun onResume() {
        super.onResume()
        // Toggle the `cameraActive` alias in your App.qml
        qtView.setProperty("cameraActive", true)
    }

    override fun onPause() {
        qtView.setProperty("cameraActive", false)
        super.onPause()
    }

    override fun onDestroyView() {
        // Remove the QtQuickView so it can be GC’d
        binding.cameraQmlFrame.removeView(qtView)
        _binding = null
        super.onDestroyView()
    }
}
