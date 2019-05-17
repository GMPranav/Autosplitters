state("POP2"){
//this variable is 0 during gameplay, 1 in cutscenes, 2 when a cutscene ends
	int cutscene : 0x0096602C, 0x8, 0x28, 0xA8, 0x3E0;
	
//Story counter/gate/value
	int storyValue : 0x523578;	
	
//shahdee's and kaileena's health
	int bossHealth : 0x0090C418, 0x18, 0x4, 0x48, 0x198;

//The Prince's coords
	float xPos : 0x90C414, 0x18, 0x0, 0x4, 0x20, 0x30;	
	float yPos : 0x90C414, 0x18, 0x0, 0x4, 0x20, 0x34;
	float zPos : 0x90C414, 0x18, 0x0, 0x4, 0x20, 0x38;	
	
//currently loaded area id (changes with every load trigger)
	int map : 0x523594;
	
//A value that changes reliably depending on which weapon you pick up
	int secondaryWeapon : 0x0053F8F0, 0x4, 0x164, 0xC, 0x364;
	
//state of the prince (11 is drinking)
	int state : 0x90C414, 0x18, 0x4, 0x48, 0x3F8;
}

start{
	if (current.map == 1292342859 && old.cutscene == 1 && current.cutscene == 2)	//start the timer when a new game is started (after the opening cutscene has ended)
			return true;
}

reset{
	//reset the timer when a new game is started (when the first area of boat loads)
	if (old.map == 234881388 && current.map == 1292342859)
		return true;
}

//update{
	//print(vars.skipSplits.ToString());
//}

split{	
	switch(timer.Run.GetExtendedCategoryName())
	{
		case "Any% (Normal)":																									//Any% (Normal) splits
		case "Any% (Zipless)":																									//Any% (Zipless) splits, same as Any% (Normal) splits
			switch (timer.CurrentSplitIndex)
			{
				case 0:
					if (current.map == 67109218 && current.bossHealth == 0 && old.cutscene == 0 && current.cutscene == 1)		//boat
						return true;
					break;
				case 1:
					if (current.map == 135462572 && old.cutscene == 0 && current.cutscene == 1)									//raven man
						return true;
					break;
				case 2:
					if (current.map == 285231807 && old.cutscene == 0 && current.cutscene == 1)									//portal
						return true;
					break;
				case 3:
					if ((current.storyValue == 58 || current.storyValue == 59) && old.state != 11 && current.state == 11)		//foundry fountain
						return true;
					break;
				case 4:
					if ((current.map == 135505359 || current.map == 135516393 || current.map == 135483948 || current.map == 16809649 || current.map == 135483950) && current.xPos < -164 && old.cutscene == 0 && current.cutscene == 1)		//scorpion 
						return true;
					break;
				case 5:
					if (old.storyValue != 63 && current.storyValue == 63)														//63
						return true;
					break;
				case 6:
					if ((current.map == -1509855113 || current.map == 285233488) && old.cutscene == 0 && current.cutscene == 1)	//second portal
						return true;
					break;
				case 7:
					if (current.map == 989966866 && current.bossHealth == 0 && old.cutscene == 0 && current.cutscene == 1)		//kaileena
						return true;
					break;
				default:
					break;
			}
			break;


		case "True Ending (Normal)":																							//True Ending (Normal) splits
			switch (timer.CurrentSplitIndex)
			{
				case 0:
					if (current.map == 67109218 && current.bossHealth == 0 && old.cutscene == 0 && current.cutscene == 1)		//boat
						return true;
					break;
				case 1:
					if (current.map == 135462572 && old.cutscene == 0 && current.cutscene == 1)									//raven man
						return true;
					break;
				case 2:
					if (current.map == 135501679 && old.cutscene == 0 && current.cutscene == 1)									//life 1 (fortress entrance)
						return true;
					break;
				case 3:
					if ((current.map == 135516393 || current.map == 135483948 || current.map ==  16809649) && current.xPos > -120 && old.cutscene == 0 && current.cutscene == 1)		//life 2 (prison)
						return true;
					break;
				case 4:
					if ((current.map == 67144064 || current.map == 67144084) && old.cutscene == 0 && current.cutscene == 1)		//life 3 (library)
						return true;
					break;
				case 5:
					if (current.map == 67145445 && old.cutscene == 0 && current.cutscene == 1)									//life 4 (mech tower)
						return true;
					break;
				case 6:
					if ((current.map == 1006690753 || current.map == 1006690755) && old.cutscene == 0 && current.cutscene == 1)	//life 5 (garden)
						return true;
					break;
				case 7:
					if ((current.map == 687877046 || current.map == 687877489) && current.xPos > 70 && old.cutscene == 0 && current.cutscene == 1)	//life 6 (waterworks)
						return true;
					break;
				case 8:
					if ((current.map == 285225347 || current.map == 1006717295) && old.cutscene == 0 && current.cutscene == 1)	//life 7 (sacrificial altar)
						return true;
					break;
				case 9:
					if ((current.map == 989860398 || current.map == 1006711848) && old.cutscene == 0 && current.cutscene == 1)	//life 8 (southern passage)
						return true;
					break;
				case 10:
					if (current.map == 67144144 && old.cutscene == 0 && current.cutscene == 1)									//life 9 (main hall)
						return true;
					break;
				case 11:
					if ((current.map == 1006704429 || current.map == 1006704427) && old.xPos > -98 && old.cutscene == 0 && current.cutscene == 1)	//water sword
						return true;
					break;
				case 12:
					if (current.map == 989966868 && current.yPos > 200 && old.cutscene == 0 && current.cutscene == 1)			//dahaka
						return true;
					break;
				default:
					break;
			}
			break;


		case "True Ending (Zipless)":																							//True Ending (Zipless) splits
			switch (timer.CurrentSplitIndex)
			{
				case 0:
					if (current.map == 67109218 && current.bossHealth == 0 && old.cutscene == 0 && current.cutscene == 1)		//boat
						return true;
					break;
				case 1:
					if (current.map == 135462572 && old.cutscene == 0 && current.cutscene == 1)									//raven man
						return true;
					break;
				case 2:
					if (current.map == 67144144 && old.cutscene == 0 && current.cutscene == 1)									//life 1 (main hall)
						return true;
					break;
				case 3:
					if ((current.map == 687877046 || current.map == 687877489) && current.xPos > 70 && old.cutscene == 0 && current.cutscene == 1)	//life 2 (waterworks)
						return true;
					break;
				case 4:
					if ((current.map == 1006690753 || current.map == 1006690755) && old.cutscene == 0 && current.cutscene == 1)	//life 3 (garden)
						return true;
					break;
				case 5:
					if (current.map == 135501679 && old.cutscene == 0 && current.cutscene == 1)									//life 4 (fortress entrance)
						return true;
					break;
				case 6:
					if (old.storyValue == 58 && current.storyValue == 59)														//59
						return true;
					break;
				case 7:
					if ((current.map == 135516393 || current.map == 135483948 || current.map ==  16809649) && current.xPos > -120 && old.cutscene == 0 && current.cutscene == 1)		//life 5 (prison)
						return true;
					break;
				case 8:
					if (current.map == 67144084 && old.cutscene == 0 && current.cutscene == 1)									//life 6 (library)
						return true;
					break;
				case 9:
					if (old.storyValue != 63 && current.storyValue == 63)														//63
						return true;
					break;
				case 10:
					if (current.map == 67145445 && old.cutscene == 0 && current.cutscene == 1)									//life 4 (mech tower)
						return true;
					break;
				case 11:
					if ((current.map == 989860398 || current.map == 1006711848) && old.cutscene == 0 && current.cutscene == 1)	//life 8 (southern passage)
						return true;
					break;
				case 12:
					if ((current.map == 285225347 || current.map == 1006717295) && old.cutscene == 0 && current.cutscene == 1)	//life 9 (sacrificial altar)
						return true;
					break;
				case 13:
					if ((current.map == 1006704429 || current.map == 1006704427) && old.xPos > -98 && old.cutscene == 0 && current.cutscene == 1)	//water sword
						return true;
					break;
				case 14:
					if (current.map == 989966868 && current.yPos > 200 && old.cutscene == 0 && current.cutscene == 1)			//dahaka
						return true;
					break;
				default:
					break;
			}
			break;

			
		case "Any% (No Major Glitches)":																						//Any% (No Major Glitches) splits
			switch (timer.CurrentSplitIndex)
			{
				case 0:
					if (current.map == 67109218 && current.bossHealth == 0 && old.cutscene == 0 && current.cutscene == 1)		//boat
						return true;
					break;
				case 1:
					if (current.map == 135462576 && old.cutscene == 0 && current.cutscene == 1)									//spider sword
						return true;
					break;
				case 2:
					if (current.map == 989860400 && old.cutscene == 0 && current.cutscene == 1)									//chasing shahdee
						return true;
					break;
				case 3:
					if (current.map == 1006801609 && current.bossHealth == 0 && old.cutscene == 0 && current.cutscene == 1)		//a damsel in distress
						return true;
					break;
				case 4:
					if (current.map == 989884886 && old.cutscene == 0 && current.cutscene == 1)									//the dahaka
						return true;
					break;
				case 5:
					if (current.map == 1006704429 && old.cutscene == 0 && current.cutscene == 1 && current.storyValue == 13)	//serpent sword
						return true;
					break;
				case 6:
					if ((current.map == 135495099 || current.map == 135495097) && old.cutscene == 0 && current.cutscene == 1)	//garden hall
						return true;
					break;
				case 7:
					if (current.map == 687877048 && old.cutscene == 0 && current.cutscene == 1)									//waterworks
						return true;
					break;
				case 8:
					if (current.map == 67112526 && old.cutscene == 0 && current.cutscene == 1 && current.storyValue == 21)		//lion sword
						return true;
					break;
				case 9:
					if (current.map == 687876481 && old.zPos < 410 && current.zPos >= 410)										//mech tower
						return true;
					break;
				case 10:
					if (current.map == 285235400 && old.cutscene == 0 && current.cutscene == 1)									//breath of fate
						return true;
					break;
				case 11:
					if (current.map == 67145437 && old.cutscene == 0 && current.cutscene == 1)									//activation room in ruin
						return true;
					break;
				case 12:
					if (current.map == 67145455 && old.cutscene == 0 && current.cutscene == 1)									//activation room restored
						return true;
					break;
				case 13:
					if (current.map == 67112526 && old.yPos < -13 && current.yPos >= -13 && current.zPos < 391 && current.storyValue == 33)			//the death of the sand wraith
						return true;
					break;
				case 14:
					if (old.storyValue == 34 && current.storyValue == 38)														//the death of the empress
						return true;
					break;
				case 15:
					if (current.map == 135464247 && current.zPos > 33 && old.cutscene == 0 && current.cutscene == 1)			//exit the tomb
						return true;
					break;
				case 16:
					if (current.map == 135483950 && old.cutscene == 0 && current.cutscene == 1)									//scorpion sword
						return true;
					break;
				case 17:
					if (current.map == 67116821 && old.xPos < -112 && current.xPos >= -112 && current.storyValue == 42)			//library
						return true;
					break;
				case 18:
					if (old.map == 1006704427 && current.map == 1006704429 && current.storyValue == 45)							//hourglass revisited
						return true;
					break;
				case 19:
					if (current.map == 285231214 && old.cutscene == 0 && current.cutscene == 1)									//mask on
						return true;
					break;
				case 20:
					if (current.map == 285231574 && current.yPos < 195 && old.cutscene == 0 && current.cutscene == 1)			//sand griffin
						return true;
					break;
				case 21:
					if (current.map == 1006801611 && old.cutscene == 0 && current.cutscene == 1)								//mirrored fates
						return true;
					break;
				case 22:
					if (current.map == 135501700 && old.cutscene == 0 && current.cutscene == 1)									//a favor unknown
						return true;
					break;
				case 23:
					if (current.map == 67116821 && old.xPos < -112 && current.xPos >= -112 && current.storyValue == 60)			//library revisited
						return true;
					break;
				case 24:
					if ((current.map == 587202754 || current.map == 587203393) && old.secondaryWeapon != 50 && current.secondaryWeapon == 50)	//banana
						return true;
					break;
				case 25:
					if (current.map == 67112526 && old.cutscene == 0 && current.cutscene == 1 && current.storyValue == 64)		//mask off
						return true;
					break;
				case 26:
					if (current.map == 989966866 && current.bossHealth == 0 && old.cutscene == 0 && current.cutscene == 1)		//kaileena
						return true;
					break;
				default:
					break;
			}
			break;
			
			
		case "True Ending (No Major Glitches)":																					//True Ending (No Major Glitches) splits
			switch (timer.CurrentSplitIndex)
			{
				case 0:
					if (current.map == 67109218 && current.bossHealth == 0 && old.cutscene == 0 && current.cutscene == 1)		//boat
						return true;
					break;
				case 1:
					if (current.map == 135462576 && old.cutscene == 0 && current.cutscene == 1)									//spider sword
						return true;
					break;
				case 2:
					if (current.map == 1006711848 && old.cutscene == 0 && current.cutscene == 1)								//life 1 (southern passage)
						return true;
					break;
				case 3:
					if (current.map == 1006801609 && current.bossHealth == 0 && old.cutscene == 0 && current.cutscene == 1)		//a damsel in distress
						return true;
					break;
				case 4:
					if (current.map == 1006717295 && old.cutscene == 0 && current.cutscene == 1)								//life 2 (sacrificial altar)
						return true;
					break;
				case 5:
					if (current.map == 989884886 && old.cutscene == 0 && current.cutscene == 1)									//the dahaka
						return true;
					break;
				case 6:
					if (current.map == 135501679 && old.cutscene == 0 && current.cutscene == 1)									//life 3 (fortress entrance)
						return true;
					break;
				case 7:
					if (current.map == 1006704429 && old.cutscene == 0 && current.cutscene == 1 && current.storyValue == 13)	//the serpent sword
						return true;
					break;
				case 8:
					if ((current.map == 135495099 || current.map == 135495097) && old.cutscene == 0 && current.cutscene == 1)	//garden hall
						return true;
					break;
				case 9:
					if (current.map == 687877489 && old.cutscene == 0 && current.cutscene == 1)									//life 4 (waterworks)
						return true;
					break;
				case 10:
					if (current.map == 1006690755 && old.cutscene == 0 && current.cutscene == 1)								//life 5 (garden)
						return true;
					break;
				case 11:
					if (current.map == 67144144 && old.cutscene == 0 && current.cutscene == 1)									//life 6 (main hall)
						return true;
					break;
				case 12:
					if (current.map == 687876481 && old.zPos < 410 && current.zPos >= 410)										//mech tower
						return true;
					break;
				case 13:
					if (current.map == 285235400 && old.cutscene == 0 && current.cutscene == 1)									//breath of fate
						return true;
					break;
				case 14:
					if (current.map == 67145437 && old.cutscene == 0 && current.cutscene == 1)									//activation room in ruin
						return true;
					break;
				case 15:
					if (current.map == 67145445 && old.cutscene == 0 && current.cutscene == 1)									//life 7 (mech tower)
						return true;
					break;
				case 16:
					if (current.map == 67112526 && old.yPos < -13 && current.yPos >= -13 && current.zPos < 391 && current.storyValue == 33)			//the death of the sand wraith
						return true;
					break;
				case 17:
					if (old.storyValue == 34 && current.storyValue == 38)														//the death of the empress
						return true;
					break;
				case 18:
					if (current.map == 135464247 && current.zPos > 33 && old.cutscene == 0 && current.cutscene == 1)			//exit the tomb
						return true;
					break;
				case 19:
					if (current.map == 135483950 && old.cutscene == 0 && current.cutscene == 1)									//scorpion sword
						return true;
					break;
				case 20:
					if (current.map ==  16809649 && old.cutscene == 0 && current.cutscene == 1)									//life 8 (prison)
						return true;
					break;
				case 21:
					if (current.map == 67144084 && old.cutscene == 0 && current.cutscene == 1)									//life 9 (library)
						return true;
					break;
				case 22:
					if (current.map == 1006704429 && old.xPos > -98 && old.cutscene == 0 && current.cutscene == 1)				//water sword
						return true;
					break;
				case 23:
					if (current.map == 285231214 && old.cutscene == 0 && current.cutscene == 1)									//mask on
						return true;
					break;
				case 24:
					if (current.map == 285231574 && current.yPos < 195 && old.cutscene == 0 && current.cutscene == 1)			//sand griffin
						return true;
					break;
				case 25:
					if (current.map == 1006801611 && old.cutscene == 0 && current.cutscene == 1)								//mirrored fates
						return true;
					break;
				case 26:
					if (current.map == 135501700 && old.cutscene == 0 && current.cutscene == 1)									//a favor unknown
						return true;
					break;
				case 27:
					if (current.map == 67116821 && old.xPos < -112 && current.xPos >= -112 && current.storyValue == 60)			//library revisited
						return true;
					break;
				case 28:
					if ((current.map == 587202754 || current.map == 587203393) && old.secondaryWeapon != 50 && current.secondaryWeapon == 50)	//banana
						return true;
					break;
				case 29:
					if (current.map == 67112526 && old.cutscene == 0 && current.cutscene == 1 && current.storyValue == 64)		//mask off
						return true;
					break;
				case 30:
					if (current.map == 989966868 && current.yPos > 200 && old.cutscene == 0 && current.cutscene == 1)			//dahaka
						return true;
					break;			
				default:
					break;
			}
			break;
			
		default:
			break;
	}	
}