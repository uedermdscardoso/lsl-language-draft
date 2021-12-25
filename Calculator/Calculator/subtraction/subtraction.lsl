default
{
	state_entry()
	{
		llSetText("-",<0,1,0>,1.0);
	}

	touch_start(integer total_number)
	{
		llSetScale(llGetScale()-<0,0,1>);
		llSay(-1625, "-");
	}

	touch_end(integer x)
	{
		llSetScale(llGetScale()+<0,0,0.5>);
	}
}
