package com.example.game_pad

import android.Manifest
import android.bluetooth.BluetoothDevice
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.content.pm.PackageManager
import android.os.Bundle
import android.os.PersistableBundle
import androidx.core.app.ActivityCompat
import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {

    private val receiver: BlueConnectedBroadcast = BlueConnectedBroadcast()

    override fun onCreate(savedInstanceState: Bundle?, persistentState: PersistableBundle?) {
        super.onCreate(savedInstanceState, persistentState)
    }

    override fun onResume() {
        super.onResume();
        registerReceiver()
    }

    override fun onPause() {
        super.onPause()
        unregisterReceiver(receiver)
    }

    private fun registerReceiver() {
        val filterAction = IntentFilter()
        filterAction.addAction(BluetoothDevice.ACTION_ACL_CONNECTED)
        filterAction.addAction(BluetoothDevice.ACTION_ACL_DISCONNECTED)
        receiver.listener = object : BlueConnectedBroadcastListener{
            override fun onReceive(context: Context?, intent: Intent?) {
                intent?.let {
                    if (intent.action == BluetoothDevice.ACTION_ACL_CONNECTED) {
                        val device = intent.getParcelableExtra<BluetoothDevice>(BluetoothDevice.EXTRA_DEVICE)
                        if (ActivityCompat.checkSelfPermission(this@MainActivity, Manifest.permission.BLUETOOTH_CONNECT) != PackageManager.PERMISSION_GRANTED) {
                            print(device?.name)
                            print(device?.address)
                        }
                    }

                    if (intent.action == BluetoothDevice.ACTION_ACL_DISCONNECTED) {
                        val device = intent.getParcelableExtra<BluetoothDevice>(BluetoothDevice.EXTRA_DEVICE)
                        if (ActivityCompat.checkSelfPermission(this@MainActivity, Manifest.permission.BLUETOOTH_CONNECT) != PackageManager.PERMISSION_GRANTED) {
                            print(device?.name)
                            print(device?.address)
                        }
                    }
                }
            }
        }
        registerReceiver(receiver, filterAction);
    }

}
