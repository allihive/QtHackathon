package com.example.baserobo.ui.home
import com.example.baserobo.R
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Toast
import androidx.fragment.app.Fragment
import com.example.baserobo.databinding.FragmentHomeBinding
import org.qtproject.example.RobotApp.RobotContent.Screen01
import org.qtproject.qt.android.QtQuickView

class HomeFragment : Fragment() {

    private var homeFragmentBinding: FragmentHomeBinding? = null
    private val binding get() = homeFragmentBinding!!

    private lateinit var homeQmlContent: Screen01
    private lateinit var homeQtQuickView: QtQuickView

    private var sun = 1
    private var rain = 1

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        homeQtQuickView = QtQuickView(requireActivity())
        homeQmlContent = Screen01()

        homeFragmentBinding = FragmentHomeBinding.inflate(inflater, container, false)
        binding.homeQmlFrame.addView(homeQtQuickView)
        homeQtQuickView.loadContent(homeQmlContent)

        binding.buttonSun.setOnClickListener {
            sun++
            binding.buttonSun.setBackgroundColor(resources.getColor(R.color.sun, null))
            checkKuku()
        }

        binding.buttonRain.setOnClickListener {
            rain++
            binding.buttonRain.setBackgroundColor(resources.getColor(R.color.rain, null))
            checkKuku()
        }

        return binding.root
    }

    private fun checkKuku() {
        if (sun >= 4 && rain >= 4) {
            Toast.makeText(requireContext(), "KUKU", Toast.LENGTH_SHORT).show()

            binding.buttonSun.setBackgroundColor(resources.getColor(R.color.sun_full_color, null))
            binding.buttonRain.setBackgroundColor(resources.getColor(R.color.rain_full_color, null))

            sun = 1
            rain = 1
        }
    }

    override fun onDestroyView() {
        super.onDestroyView()
        homeFragmentBinding = null
    }
}
