startup
{
	// Autosplitter for Barney's Hide & Seek Game
	//
	// Intended to be used with a splits file with four splits:
	// - Level 1 ("Forest Friends")
	// - Level 2 ("Music Town")
	// - Level 3 ("Deep Blue Sea")
	// - Level 4 ("Farm Fun")
}

init
{
	vars.DoSplitAndAdvanceGameState = false;
	vars.GameState = (int)0;
}

update
{
	if (timer.CurrentPhase == TimerPhase.NotRunning || timer.CurrentPhase == TimerPhase.Ended)
	{
		// Game has ended or hasn't started yet.
		vars.GameState = (int)0;
		vars.DoSplitAndAdvanceGameState = false;
		features["start"].resume();

		features["bluedino1"].pause();
		features["pinkdino1"].pause();
		features["purpledino1"].pause();
		features["end"].pause();
	}
	else
	{
		features["start"].pause();
	}

	if (timer.CurrentPhase == TimerPhase.Running) {

		if (vars.GameState == 0)
		{
			// In "Forest Friends", looking for transition screen
			features["bluedino1"].resume();
			if (features["bluedino1"].current > 94)
			{
				vars.DoSplitAndAdvanceGameState = true;
			}
		}
		else if (vars.GameState == 1)
		{
			// Waiting to get off of the transition screen
			if (!(features["bluedino1"].current > 94))
			{
				vars.GameState++;
				features["bluedino1"].pause();
			}
		}
		else if (vars.GameState == 2)
		{
			// In "Music Town", looking for transition screen
			features["pinkdino1"].resume();
			if (features["pinkdino1"].current > 94)
			{
				vars.DoSplitAndAdvanceGameState = true;
			}
		}
		else if (vars.GameState == 3)
		{
			// Waiting to get off of the transition screen
			if (!(features["pinkdino1"].current > 94))
			{
				vars.GameState++;
				features["pinkdino1"].pause();
			}
		}
		else if (vars.GameState == 4)
		{
			// In "Deep Blue Sea", looking for transition screen
			features["purpledino1"].resume();
			if (features["purpledino1"].current > 94)
			{
				vars.DoSplitAndAdvanceGameState = true;
			}
		}
		else if (vars.GameState == 5)
		{
			// Waiting to get off of the transition screen
			if (!(features["purpledino1"].current > 94))
			{
				vars.GameState++;
				features["purpledino1"].pause();
			}
		}
		else if (vars.GameState == 6)
		{
			// In "Farm Fun", looking for the wave
			features["end"].resume();
			if (features["end"].current > 93)
			{
				vars.DoSplitAndAdvanceGameState = true;
				features["end"].pause(); // we're done here
			}
		}
	}

	if (timer.CurrentPhase == TimerPhase.Running || timer.CurrentPhase == TimerPhase.Paused ||
		timer.CurrentPhase == TimerPhase.Ended)
	{
		// We can't use the 'reset' stanza, because 'reset' is not evaluated when the
		// timer has ended. According to the Speedrun Tool Development discord, this
		// is intentional.
		if (features["reset"].current > 92)
		{
			var timerModel = new TimerModel { CurrentState = timer };
			timerModel.Reset();
		}
	}
}

start
{
	return features["start"].current > 95;
}

reset
{
	// We don't use this, because we reset in 'update'.
	return false;
}

split
{
	if (vars.DoSplitAndAdvanceGameState)
	{
		vars.DoSplitAndAdvanceGameState = false;
		vars.GameState++;
		return true;
	}

	return false;
}
