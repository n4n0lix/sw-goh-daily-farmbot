#include <MsgBoxConstants.au3>
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <WinAPI.au3>
#include <SendMessage.au3>
#include <Debug.au3>

#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("Form1", 390, 400, 302, 148)
GUISetBkColor(0xBFCDDB)
$Label1 = GUICtrlCreateLabel("SW:GOH Daily Bot", 8, 8, 262, 44)
GUICtrlSetFont(-1, 24, 400, 0, "Trebuchet MS")
$Button1 = GUICtrlCreateButton("Start", 272, 368, 107, 25)
$Edit1 = GUICtrlCreateEdit("", 8, 136, 369, 225, $ES_WANTRETURN)
GUICtrlSetFont(-1, 8, 800, 0, "Consolas")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlSetBkColor(-1, 0x000000)
$Label2 = GUICtrlCreateLabel("Andyroid Path:", 8, 60, 73, 17)
$Input1 = GUICtrlCreateInput("C:\Program Files\Andy\Andy.exe", 120, 56, 233, 21)
$Label3 = GUICtrlCreateLabel("Andyroid Start Delay:", 8, 84, 103, 17)
$Label4 = GUICtrlCreateLabel("SW:GOH Start Delay:", 8, 108, 107, 17)
$Input2 = GUICtrlCreateInput("60", 120, 80, 33, 21)
$Input3 = GUICtrlCreateInput("60", 120, 104, 33, 21)
$Label5 = GUICtrlCreateLabel("s", 160, 84, 9, 17)
$Label6 = GUICtrlCreateLabel("s", 160, 108, 9, 17)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

$debugs = "";
$hwnd = 0

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit

		Case $Button1
		   Routine()
	EndSwitch
WEnd


Func Routine()
   StartAndyroid()
   StartStarWars()

   Exit 0

   ; The times that are calculated here are only time that we can
   ; be 100% sure its consumes. There are some actions that consume
   ; 0:00, which is infact wrong, as it consumes time, but only a small
   ; negligible amount of time.

   Debug("[TIME] 0:00")
   ;==========================  (0:00) ===
   CollectInbox();              +0:00
   Do_Challenges1_5();          +0:00

   ;---------------------------  0:00
   SquadArena_DoBattle();       +2:00

   ;---------------------------  2:00
   GalacticWar1To4();           +4:00

   ;---------------------------  6:00
   FleetArena_DoBattle();       +4:00

   ;--------------------------- 10:00
   WaitSeconds(30)

   Debug("[TIME] 10:00")
   ;========================== (10:00) ===
   Do_Challenges2_5()

   ;--------------------------- 10:00
   SquadArena_DoBattle();       +2:00

   ;--------------------------- 12:00
   FleetArena_DoBattle();       +4:00

   ;--------------------------- 16:00
   Character_MinimalTraining(); +0:00
   Character_ModUpgrade();      +0:00
   Ship_MinimalEnhancement();   +0:00
   GalacticWar5To6();           +2:00

   ;--------------------------- 18:00
   WaitMinutes(2);              +2:00

   Debug("[TIME] 20:00")
   ;========================== (20:00) ===
   Do_Challenges3_5();          +0:00

   ;--------------------------- 20:00
   SquadArena_DoBattle();       +2:00

   ;--------------------------- 22:00
   FleetArena_DoBattle();       +4:00

   ;--------------------------- 26:00
   Cantina_OldBen();            +0:00
   Ashoka_LightShards();        +0:00
   Ashoka_DarkShards();         +0:00

   ;--------------------------- 26:00
   WaitMinutes(4);              +4:00
   WaitSeconds(30) ; To be sure

   Debug("[TIME] 30:00")
   ;========================== (30:00) ===
   Do_Challenges4_5();          +0:00

   ;--------------------------- 30:00
   SquadArena_DoBattle();       +2:00

   ;--------------------------- 32:00
   FleetArena_DoBattle();       +4:00

   ;--------------------------- 36:00
   WaitMinutes(4);              +4:00
   WaitSeconds(30) ; To be sure

   Debug("[TIME] 40:00")
   ;========================== (40:00) ===
   Do_Challenges5_5();          +0:00

   ;--------------------------- 40:00
   SquadArena_DoBattle();       +2:00

   ;--------------------------- 42:00
   FleetArena_DoBattle();       +4:00

   ;--------------------------- 46:00
   Home()
   ClaimActivity()	; "Complete 2 Challenges"
   ClaimActivity()	; "Finish 3 Light Side Battles"
   ClaimActivity()	; "Finish 3 Dark Side Battles"
   ClaimActivity()	; "Finish 2 Battles in the Squad Arena"
   ClaimActivity()	; "Embark on Galactic War"
   ClaimActivity()	; "Daily Fleet Arena Fight"
   ClaimActivity()	; "Fleet Challenge Completion"
   ClaimActivity()	; "Ship Enhancement"
   ClaimActivity()	; "Character Training"

   Debug("Routine completed")
EndFunc

;========================================================
;=============         Navigation           =============
;========================================================

Func StartAndyroid()
   Debug("starting andyroid ...")

   Run(GUICtrlRead($Input1))
   WinWait("Andy 46.16.819")
   $hwnd = WinGetHandle("Andy 46.16.819")

   WinSetState($hwnd, "", @SW_MAXIMIZE)
   Sleep(GUICtrlRead($Input2) * 1000)
EndFunc

Func StartStarWars()
   Debug("starting star wars: galaxy of heroes ...")
   Touch(1642, 191)
   Sleep(GUICtrlRead($Input3) * 10000)
EndFunc

Func Home()
   Touch(1822, 85)
   Touch(1822, 85)
EndFunc

Func Back()
   Touch(100, 85)
EndFunc

Func Goto_Characters()
   Home()
   Touch(110, 240, 1000)
EndFunc

Func Goto_Ships()
   Home()
   Touch(106, 367)
EndFunc

Func Goto_ShipChallenges()
   Goto_ShipBattles()
   Touch(1396, 518)
EndFunc

Func Goto_Challenges()
   Goto_Characters()
   Touch(1822, 85)
   Touch(40, 620)
EndFunc

Func Goto_LightSideHard()
   Home()
   Touch(700, 670)
   Touch(1620, 940)
EndFunc

Func Goto_DarkSideHard()
   Home()
   Touch(1205, 628)
   Touch(1620, 940)
EndFunc

Func Goto_ShipBattles()
   Goto_Characters()
   Touch(1822, 85, 500)
   Touch(1860, 391)
EndFunc

Func Goto_SquadArena()
   Home()
   Touch(1377, 396)
EndFunc

Func Goto_GalacticWar()
   Home()
   Touch(1603, 329)
EndFunc

Func Goto_Cantina()
   Home()
   Touch(552, 403)
EndFunc

Func Reward_Continue()
   Sleep(2000)
   Touch(982, 860, 500)
   Touch(969, 811)
EndFunc

;========================================================
;=============          General             =============
;========================================================

Func Ship_MinimalEnhancement()
   Debug("[ACTION] Minimal Ship Enhancement")
   Goto_Ships()
   Characters_ResetFilter()
   Characters_ResetSort()
   Ships_SetFilterActivated()
   Characters_SetSortFilter()
   Characters_ToggleSort()

   Touch(360, 415)
   Touch(236, 917)
   Touch(180, 267)
   Touch(705, 529)
   Touch(974, 652)
   Touch(1660, 904)
   Touch(931, 571)
   Touch(968, 840)
   Back()
   Back()

   Characters_ResetFilter()
   Characters_ResetSort()
   Characters_ToggleSort()
EndFunc

Func Character_MinimalTraining()
   Debug("[ACTION] Minimal Character Training")
   Goto_Characters()
   Characters_ResetFilter()
   Characters_ResetSort()
   Characters_SetFilterActivated()
   Characters_SetSortFilter()
   Characters_ToggleSort()

   Touch(275, 363)  ; Select Character
   Touch(240, 916)  ; 'Train'
   Touch(180, 267)  ; Select 1 Traindroid
   Touch(705, 529)
   Touch(974, 652)
   Touch(1660, 904)	; 'Train'
   Touch(931, 571)	; Accelerate Progress
   Touch(968, 840)  ; Reward 'Continue'
   Back()
   Back()

   Characters_ResetFilter()
   Characters_ResetSort()
   Characters_ToggleSort()
EndFunc

Func Character_ModUpgrade()
   Debug("[ACTION] Mod upgrading")
   Goto_Characters()
   Touch(296, 373)
   Touch(1663, 660)
   Touch(913, 528)
   Touch(1650, 495)
   Touch(780, 809)
   Touch(1310, 174)
EndFunc

Func Ships_SetFilterActivated()
   Touch(918, 224)
   Touch(738, 301)
   Touch(950, 897)
EndFunc

Func Characters_SetFilterActivated()
   Touch(918, 224)
   Touch(734, 394)
   Touch(950, 897)
EndFunc

Func Characters_SetSortFilter()
   Touch(1442, 220)
   Touch(736, 396)
   Touch(950, 897)
EndFunc

Func Characters_ResetFilter()
   Touch(918, 224)
   Touch(734, 207)
   Touch(734, 207)
   Touch(950, 897)
EndFunc

Func Characters_ResetSort()
   Touch(1442, 220)
   Touch(734, 207)
   Touch(734, 207)
   Touch(950, 897)
EndFunc

Func Characters_ToggleSort()
   Touch(1769, 224)
EndFunc

Func ClaimActivity()
   Home()
   Touch(1650, 925)
   Touch(1654, 880)
EndFunc

Func Challenges_SimFirst()
   Touch(330, 890)
   Touch(1020, 800)
   Touch(979, 650)
   Reward_Continue()
EndFunc

Func Challenges_SimSecond()
   Touch(890, 890)
   Touch(1020, 800)
   Touch(979, 650)
   Reward_Continue()
EndFunc

Func Ashoka_LightShards()
   Debug("[ACTION] Ashoka Light Shards")
   Goto_LightSideHard()
   ; Goto 5
   Touch(1018, 186)
   ; TODO: hardcoded ashoka tano 5-D
   Touch(300, 515)
   Touch(1405, 826)
   DoBattlesMultiSim()
EndFunc

Func CollectInbox()
   Debug("[ACTION] Claim mail contents")
   For $i = 1 To 5
	  Home()
	  Touch(109, 639)
	  Touch(1546, 885)
   Next
EndFunc

Func Ashoka_DarkShards()
   Debug("[ACTION] Ashoka Dark Shards")
   Goto_DarkSideHard()
   ; Goto 4
   TouchSlow($hwnd, 803, 182)
   ; TODO: hardcoded ashoka tano 5-D
   TouchSlow($hwnd, 466, 393)
   DoBattlesMultiSim()
EndFunc

Func Cantina_OldBen()
   Debug("[ACTION] Cantina Old Ben")
   Goto_Cantina()
   Touch(1235, 182, 2000)
   Touch(200, 544, 2000)
   Touch(217, 536, 2000)
   DoBattlesMultiSim(20)
EndFunc

Func GalacticWar1To4()
   Debug("[ACTION] Galactic War 1-4")
   Goto_GalacticWar()
   ; Reset Galactic War
   Touch(349, 941)
   Touch(1170, 642)
   ; 1st Battle
   Debug("[ACTION] Galactic War 1")
   DoGalacticBattle()
   Touch(604, 511)
   Reward_Continue()
   ; 2nd Battle
   Debug("[ACTION] Galactic War 2")
   DoGalacticBattle()
   Touch(669, 679)
   Reward_Continue()
   ; 3rd Battle
   Debug("[ACTION] Galactic War 3")
   DoGalacticBattle()
   Touch(729, 387)
   Reward_Continue()
   ; 4th Battle
   Debug("[ACTION] Galactic War 4")
   DoGalacticBattle()
   Touch(733, 511)
   Reward_Continue()
EndFunc

Func GalacticWar5To6()
   Debug("[ACTION] Galactic War 5-6")
   Goto_GalacticWar()
   ; 5th Battle
   Debug("[ACTION] Galactic War 5")
   DoGalacticBattle()
   Touch(736, 685)
   Reward_Continue()
   ; 6th Battle
   Debug("[ACTION] Galactic War 6")
   DoGalacticBattle()
   Touch(736, 385)
   Reward_Continue()
EndFunc

Func DoGalacticBattle()
   Touch(1641, 820)
   Touch(1629, 919)
   Sleep(10 * 1000)
   DoAutobattle()
   Sleep(60 * 1000)
EndFunc

Func SquadArena_DoBattle()
   Debug("[ACTION] Squad Arena Battle")
   Goto_SquadArena()
   Touch(376, 877)
   Touch(1634, 924)
   Touch(1634, 924)
   WaitSeconds(10)
   DoAutobattle()
   WaitMinutes(2)
   Touch(874, 678)
   Touch(938, 873)
   WaitSeconds(5)
EndFunc

Func FleetArena_DoBattle()
   Debug("[ACTION] Fleet Arena Battle")
   Goto_ShipBattles()
   Touch(978, 687)
   Touch(368, 879)
   Touch(1411, 922)
   WaitSeconds(10)
   DoAutobattle()
   WaitMinutes(4)
   Touch(962, 674)
   WaitSeconds(10)
EndFunc

Func Do_Challenges1_5()
   Debug("[ACTION] Challenges (1/5)")
   ;; Challenges
   Goto_Challenges()
   Challenges_SimFirst()
   Back()
   Challenges_SimSecond()
   ;; Ship Challenges
   Goto_ShipChallenges()
   Challenges_SimSecond()
EndFunc

Func Do_Challenges2_5()
   Debug("[ACTION] Challenges (2/5)")
   ;; Challenges
   Goto_Challenges()
   Challenges_SimFirst()
   Back()
   Challenges_SimSecond()
   ;; Ship Challenges
   Goto_ShipChallenges()
   Challenges_SimSecond()
EndFunc

Func Do_Challenges3_5()
   Debug("[ACTION] Challenges (3/5)")
   ;; Challenges
   Goto_Challenges()
   Challenges_SimFirst()
   Back()
   Challenges_SimSecond()
EndFunc

Func Do_Challenges4_5()
   Debug("[ACTION] Challenges (4/5)")
   ;; Challenges
   Goto_Challenges()
   Challenges_SimSecond()
EndFunc

Func Do_Challenges5_5()
   Debug("[ACTION] Challenges (5/5)")
   ;; Challenges
   Goto_Challenges()
   Challenges_SimSecond()
EndFunc

;========================================================
;=============           Utils              =============
;========================================================

Func DoBattlesMultiSim($sims = 5)
   Touch(1418, 826, 250)
   For $i = 1 To $sims
	  Touch(1302, 525, 250)
   Next
   Touch(991, 651)
   Reward_Continue()
EndFunc

Func DoAutobattle()
   Touch(93, 183)
EndFunc

Func HasInbox()
   Return Hex(PixelGetColor(145, 606,$hwnd)) == "00C02534"
EndFunc

;========================================================
;=============          General             =============
;========================================================

Func WaitMinutes($min)
   Sleep($min * 60 * 1000)
EndFunc

Func WaitSeconds($secs)
   Sleep($secs * 1000)
EndFunc

Func Touch($x, $y, $delay=750)
   ControlClick($hwnd, "", 0, "left", 1, $x, $y)
   Sleep($delay)
EndFunc

Func Debug($msg)
   _DebugOut($msg)
   $debugs = $debugs & $msg & @CRLF
   GUICtrlSetData($Edit1, $debugs)
EndFunc

Func _MakeLong($LoWord,$HiWord)

Return BitOR($HiWord * 0x10000, BitAND($LoWord, 0xFFFF))

EndFunc