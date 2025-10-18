using BepInEx;
using System;
using System.Runtime.InteropServices;
using UnityEngine;

namespace DiggermanSplitMod
{
    [BepInPlugin("com.yourname.diggerman.splitmod", "Diggerman Split Mod", "1.0.0")]
    public class DiggermanSplitMod : BaseUnityPlugin
    {
        private int lastScore = -1;

        // Example memory location (static for demonstration)
        private static IntPtr scoreAddress = Marshal.AllocHGlobal(sizeof(int));

        void Start()
        {
            Logger.LogInfo("✅ Diggerman Split Mod loaded!");
        }

        void Update()
        {
            var env = GameObject.FindObjectOfType<DiggermanEnvironment>();
            if (env == null) return;

            int currentScore = env.getCurrentScore();

            if (currentScore != lastScore)
            {
                lastScore = currentScore;

                // Write score into memory
                Marshal.WriteInt32(scoreAddress, currentScore);

                Logger.LogInfo($"Score updated in memory: {currentScore}");
            }
        }

        void OnDestroy()
        {
            Marshal.FreeHGlobal(scoreAddress);
        }
    }
}
