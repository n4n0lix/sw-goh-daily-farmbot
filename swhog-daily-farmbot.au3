#include <MsgBoxConstants.au3>
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <WinAPI.au3>
#include <SendMessage.au3>
#include <Debug.au3>
#include <Date.au3>

#include <GuiEdit.au3>
#include <ScrollBarsConstants.au3>

GUISetState(@SW_SHOW)
#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("SW:GOH Daily Farmbot", 391, 407, 302, 148)
GUISetBkColor(0xBFCDDB)
$Label1 = GUICtrlCreateLabel("SW:GOH Daily Farmbot", 8, 8, 262, 44)
GUICtrlSetFont(-1, 24, 400, 0, "Trebuchet MS")
$Button1 = GUICtrlCreateButton("Start", 272, 368, 107, 25)
$Edit1 = GUICtrlCreateEdit("", 8, 136, 369, 225, BitOR($ES_WANTRETURN,$WS_VSCROLL,$ES_AUTOVSCROLL))
GUICtrlSetFont(-1, 8, 800, 0, "Consolas")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlSetBkColor(-1, 0x000000)
$Label2 = GUICtrlCreateLabel("Andyroid Path:", 8, 60, 73, 17)
$Input1 = GUICtrlCreateInput("C:\Program Files\Andy\Andy.exe", 120, 56, 233, 21)
$Label3 = GUICtrlCreateLabel("Andyroid Start Delay:", 8, 84, 103, 17)
$Label4 = GUICtrlCreateLabel("SW:GOH Start Delay:", 8, 108, 107, 17)
$Input2 = GUICtrlCreateInput("30", 120, 80, 33, 21)
$Input3 = GUICtrlCreateInput("30", 120, 104, 33, 21)
$Label5 = GUICtrlCreateLabel("s", 160, 84, 9, 17)
$Label6 = GUICtrlCreateLabel("s", 160, 108, 9, 17)
$Button2 = GUICtrlCreateButton("Quickstart", 11, 369, 107, 25)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

$debugs = ""
$hwnd = 0
$isSunday = false

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit

	    Case $Button1
		    StartAndyAndGame()

		Case $Button2
		    Routine()

	EndSwitch
WEnd

Func StartAndyAndGame()
   StartAndyroid()
   StartStarWars()
   Routine()
EndFunc

Func Routine()
   ;_DebugSetup("a")
   Debug("starting routine ...")

   $hwnd = WinGetHandle("Andy 46.16.819")
   WinSetState($hwnd, "", @SW_MAXIMIZE)
   WinActivate($Form1)
   $isSunday = (@WDAY == 1)

   ; The times that are calculated here are only time that we can
   ; be 100% sure its consumes. There are some actions that consume
   ; 0:00, which is infact wrong, as it consumes time, but only a small
   ; negligible amount of time.

   Debug("[TIME] 0:00")
   ;==========================  (0:00) ===
   ;---------------------------  0:00
   SquadArena_DoBattle();       +2:00

   ;---------------------------  2:00
   FleetArena_DoBattle();       +4:00

   ;---------------------------  6:00
   GalacticWar1To2();           +4:00

   ;--------------------------- 10:00
   Do_Challenges1_5();          +0:00
   CollectInbox();              +0:00

   Debug("[TIME] 10:00")
   ;========================== (10:00) ===
   ;--------------------------- 10:00
   SquadArena_DoBattle();       +2:00

   ;--------------------------- 12:00
   FleetArena_DoBattle();       +4:00

   ;--------------------------- 16:00
   ;GalacticWar3To4();           +4:00
   WaitMinutes(4);
   ;--------------------------- 20:00
   Do_Challenges2_5();          +0:00
   Character_MinimalTraining(); +0:00

   Debug("[TIME] 20:00")
   ;========================== (20:00) ===
   ;--------------------------- 20:00
   SquadArena_DoBattle();       +2:00

   ;--------------------------- 22:00
   FleetArena_DoBattle();       +4:00

   ;--------------------------- 26:00
;   GalacticWar5To6();          +4:00
   WaitMinutes(4)

   ;--------------------------- 30:00
   Do_Challenges3_5();          +0:00
   Character_ModUpgrade();      +0:00
   Cantina_OldBen();            +0:00

   Debug("[TIME] 30:00")
   ;========================== (30:00) ===
   Do_Challenges4_5();          +0:00    *Fail to reach challenges menu*

   ;--------------------------- 30:00
   SquadArena_DoBattle();       +2:00

   ;--------------------------- 32:00
   FleetArena_DoBattle();       +4:00    *Didn't start the battle, stuck on characters menu*

   ;--------------------------- 36:00
   Ashoka_LightShards();        +0:00
   Ashoka_DarkShards();         +0:00
   WaitMinutes(4);              +4:00

   Debug("[TIME] 40:00")
   ;========================== (40:00) ===
   Do_Challenges5_5();          +0:00
   Ship_MinimalEnhancement();   +0:00

   ;--------------------------- 40:00
   SquadArena_DoBattle();       +2:00

   ;--------------------------- 42:00
   FleetArena_DoBattle();       +4:00

   ;--------------------------- 46:00
   Goto_Activities()
   ClaimActivity()	; "Complete 2 Challenges"
   ClaimActivity()	; "Finish 3 Light Side Battles"
   ClaimActivity()	; "Finish 3 Dark Side Battles"
   ClaimActivity()	; "Finish 2 Battles in the Squad Arena"
   ClaimActivity()	; "Embark on Galactic War"
   ClaimActivity()	; "Daily Fleet Arena Fight"
   ClaimActivity()	; "Fleet Challenge Completion"
   ClaimActivity()	; "Ship Enhancement"
   ClaimActivity()	; "Character Training"
   ClaimActivity()	; "10 Fights"
   ClaimActivity()	; "3 Cantina Fights"
   ClaimActivity()	; "5 Hard Fights"
   ClaimActivity()
   Debug("Routine completed")
EndFunc

; Ship Challenges on monday 4-6 each 2 times

;========================================================
;=============         Navigation           =============
;========================================================

Func StartAndyroid()
   Debug("starting andyroid ...")

   Run(GUICtrlRead($Input1))
   WinWait("Andy 46.16.819")
   $hwnd = WinGetHandle("Andy 46.16.819")
   WinSetState($hwnd, "", @SW_MAXIMIZE)
   WinActivate($Form1)
   Sleep(GUICtrlRead($Input2) * 1000)
EndFunc

Func StartStarWars()
   Debug("starting star wars: galaxy of heroes ...")
   Touch(1642, 191)
   Sleep(GUICtrlRead($Input3) * 1000)
EndFunc

Func Home()
   Debug("[ NAVI ] -> Home")
   Touch(1822, 85)
   Touch(1822, 85, 2000)
EndFunc

Func Back()
   Debug("[ NAVI ] Back")
   Touch(80, 80, 2000)
EndFunc

Func Goto_Activities()
   Home()
   Touch(1650, 925, 2000)
EndFunc

Func Goto_Challenges()
   Goto_Characters()
   Debug("[ NAVI ] -> Challenges")
   Touch(1822, 85, 500)
   Touch(40, 620, 50)
   Touch(40, 620, 50)
   Touch(40, 620, 50)
   Touch(40, 620, 2000)
EndFunc

Func Goto_Characters()
   Home()
   Debug("[ NAVI ] -> Characters")
   Touch(110, 240, 3000)
EndFunc

Func Goto_Ships()
   Home()
   Debug("[ NAVI ] -> Ships")
   Touch(106, 367)
EndFunc

Func Goto_ShipChallenges()
   Goto_ShipBattles()
   Debug("[ NAVI ] -> Ship Challenges")
   Touch(1396, 518, 2000)
EndFunc

Func Goto_LightSideHard()
   Home()
   Debug("[ NAVI ] -> Light Side Hard")
   Touch(700, 670, 2000)
   Touch(1620, 940, 2000)
EndFunc

Func Goto_DarkSideHard()
   Home()
   Debug("[ NAVI ] -> Dark Side Hard")
   Touch(1205, 628, 2000)
   Touch(1620, 940, 2000)
EndFunc

Func Goto_ShipBattles()
   Goto_Characters()
   Debug("[ NAVI ] -> Ship Battles")
   Touch(1822, 85, 400)
   Touch(1810,330, 50)
   Touch(1810,330, 50)
   Touch(1810,330, 50)
   Touch(1810,330, 2000)
EndFunc

Func Goto_SquadArena()
   Home()
   Debug("[ NAVI ] -> Squad Arena")
   Touch(1377, 396, 2000)
EndFunc

Func Goto_GalacticWar()
   Home()
   Debug("[ NAVI ] -> Galactic War")
   Touch(1603, 329, 2000)
EndFunc

Func Goto_Cantina()
   Home()
   Debug("[ NAVI ] -> Cantina")
   Touch(552, 403, 2000)
EndFunc

Func Reward_Continue()
   Debug("[ NAVI ] Wait for reward list ...")
   Sleep(3000)
   Debug("[ NAVI ] Continue from reward list ...")
   Touch(969, 811, 2000)
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

   Touch(275, 363, 1500)  ; Select Character
   Touch(240, 916, 1500)  ; 'Train'
   Touch(180, 267, 1500)  ; Select 1 Traindroid
   Touch(705, 529, 1500)
   Touch(974, 652, 1500)
   Touch(1660, 904, 1500)	; 'Train'
   Touch(931, 571, 1500)	; Accelerate Progress
   Touch(968, 840, 1500)  ; Reward 'Continue'
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
   Touch(1654, 880)
EndFunc

Func Challenges_SimFirst()
   Touch(330, 890, 1500)
   Touch(1020, 800, 1500)
   Touch(979, 650, 1500)
   Reward_Continue()
   Back()
EndFunc

Func Challenges_SimSecond()
   Touch(890, 890, 1500)
   Touch(1020, 800, 1500)
   Touch(979, 650, 1500)
   Reward_Continue()
   Back()
EndFunc

Func Challenges_SimThird()
   Touch(1449, 901, 1500)
   Touch(1020, 800, 1500)
   Touch(979, 650, 1500)
   Reward_Continue()
   Back()
EndFunc

Func ShipChallenges_SimFirst()
   Touch(330, 890, 1500)
   Touch(350, 800, 1500)
   Touch(979, 650, 1500)
   Reward_Continue()
   Back()
EndFunc

Func ShipChallenges_SimSecond()
   Touch(890, 890, 1500)
   Touch(350, 800, 1500)
   Touch(979, 650, 1500)
   Reward_Continue()
   Back()
EndFunc

Func Challenges_Sim4To6()
   Touch(1449, 901, 1500)
   Back()
   Touch(1480, 889)
   Touch(1020, 800)
   Touch(979, 650)
   Reward_Continue()
   Back()
   Touch(1525, 888)
   Touch(1020, 800)
   Touch(979, 650)
   Reward_Continue()
   Back()
   Touch(1595, 890)
   Touch(1020, 800)
   Touch(979, 650)
   Reward_Continue()
   Back()
EndFunc

Func Ashoka_LightShards()
   Debug("[ACTION] Ashoka Light Shards")
   Goto_LightSideHard()
   ; Goto 5
   Touch(1018, 186)
   ; TODO: hardcoded ashoka tano 5-D
   Touch(300, 515)
   DoBattlesMultiSim(5)
EndFunc

Func CollectInbox()
   Debug("[ACTION] Claim mail contents")
   Home()
   For $i = 1 To 5
	  Debug("         " & $i & " / 5 mails claimed")
	  Touch(109, 639)
	  Touch(1546, 885)
	  Back()
   Next
EndFunc

Func Ashoka_DarkShards()
   Debug("[ACTION] Ashoka Dark Shards")
   Goto_DarkSideHard()
   ; Goto 4
   Touch(803, 182)
   ; TODO: hardcoded ashoka tano 4-E
   Touch(466, 393)
   DoBattlesMultiSim(5)
EndFunc

Func Cantina_OldBen()
   Debug("[ACTION] Cantina Old Ben")
   Goto_Cantina()
   Touch(1235, 182, 2000)
   Touch(200, 544, 2000)
   Touch(217, 536, 2000)
   DoBattlesMultiSim(20)
EndFunc

Func GalacticWar1To2()
   Debug("[ACTION] Galactic War 1-2")
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
EndFunc

Func GalacticWar3To4()
   Debug("[ACTION] Galactic War 3-4")
   Goto_GalacticWar()
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
   Sleep(110 * 1000)
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
   Touch(978, 687, 2000)
   Touch(368, 879, 2000)
   Touch(1411, 922, 1000)
   WaitSeconds(15)
   DoAutobattle()
   WaitMinutes(4)
   Touch(962, 674)
   WaitSeconds(10)
EndFunc

Func Do_Challenges1_5()
   Debug("[ACTION] Challenges (1/5)")
   Goto_Challenges()

   if Not $isSunday Then
	  Challenges_SimFirst()
	  Challenges_SimSecond()
   Else
	  Challenges_SimFirst()
	  Challenges_SimSecond()
	  Challenges_SimThird()
	  Goto_Challenges()
	  Challenges_Sim4To6()
   endif

   Goto_ShipChallenges()
   ShipChallenges_SimSecond()
EndFunc

Func Do_Challenges2_5()
   Debug("[ACTION] Challenges (2/5)")
   Goto_Challenges()

   if Not $isSunday Then
	  Challenges_SimFirst()
	  Challenges_SimSecond()
   Else
	  Challenges_SimFirst()
	  Challenges_SimSecond()
	  Challenges_SimThird()
	  Goto_Challenges()
	  Challenges_Sim4To6()
   endif

   Goto_ShipChallenges()
   ShipChallenges_SimSecond()
EndFunc

Func Do_Challenges3_5()
   Debug("[ACTION] Challenges (3/5)")
   Goto_Challenges()

   if Not $isSunday Then
	  Challenges_SimFirst()
	  Challenges_SimSecond()
   Else
	  Challenges_SimFirst()
	  Challenges_SimSecond()
	  Challenges_SimThird()
	  Goto_Challenges()
	  Challenges_Sim4To6()
   endif

EndFunc

Func Do_Challenges4_5()
   Debug("[ACTION] Challenges (4/5)")
   Goto_Challenges()

   if Not $isSunday Then
	  Challenges_SimSecond()
   Else
	  Challenges_Sim4To6()
   endif

EndFunc

Func Do_Challenges5_5()
   Debug("[ACTION] Challenges (5/5)")

   if Not $isSunday Then
	  Goto_Challenges()
	  Challenges_SimSecond()
   Else
	  Goto_Challenges()
	  Challenges_Sim4To6()
   endif
EndFunc

;========================================================
;=============           Utils              =============
;========================================================

Func DoBattlesMultiSim($sims = 5)
   Touch(1418, 826)
   For $i = 1 To $sims
	  Touch(1302, 525, 500)
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
   Debug("[WAIT] Wait " & $min & " minutes")
   Sleep($min * 60 * 1000)
EndFunc

Func WaitSeconds($secs)
   Debug("[WAIT] Wait " & $secs & " seconds")
   Sleep($secs * 1000)
EndFunc

Func Touch($x, $y, $delay=1000)
   ControlClick($hwnd, "", 0, "left", 1, $x, $y)
   Sleep($delay)
EndFunc

Func Debug($msg)
   ;_DebugOut($msg)
   $debugs = $debugs & $msg & @CRLF
   GUICtrlSetData($Edit1, $debugs)
   $iEnd = StringLen(GUICtrlRead($Edit1))
   _GUICtrlEdit_SetSel($Edit1, $iEnd, $iEnd)
   _GUICtrlEdit_Scroll($Edit1, $SB_SCROLLCARET)
EndFunc

Func _MakeLong($LoWord,$HiWord)

Return BitOR($HiWord * 0x10000, BitAND($LoWord, 0xFFFF))

EndFunc
