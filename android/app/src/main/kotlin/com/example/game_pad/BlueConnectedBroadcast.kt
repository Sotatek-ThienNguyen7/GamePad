package com.example.game_pad

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent

class BlueConnectedBroadcast: BroadcastReceiver()  {

    var listener: BlueConnectedBroadcastListener? = null

    override fun onReceive(context: Context?, intent: Intent?) {
        listener?.let {
            it.onReceive(context, intent)
        }
    }
}

interface  BlueConnectedBroadcastListener {
    fun onReceive(context: Context?, intent: Intent?)
}