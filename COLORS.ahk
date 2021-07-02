#SingleInstance Force
#MaxThreadsperHotkey 2
#Include NvAPI\Class_NvAPI.ahk

Pause::
  RAINBOWS := !RAINBOWS
  HueAngle := 0
  Loop{
    if(RAINBOWS){
      sleep 500
      cnt := 0
      while (NvAPI.EnumNvidiaDisplayHandle(cnt) != "*-7")
      {
          NvAPI.SetHUEAngle(HueAngle, cnt)
          ++cnt
      }
      HueAngle := Mod(HueAngle + 1 , 360)
    }
    else{
      NvAPI.SetHUEAngle(0)
      break
    }
  }
Return
