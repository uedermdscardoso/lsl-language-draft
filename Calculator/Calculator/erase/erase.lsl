default
{
	state_entry()
	{
		llSetText("C",<0,1,0>,1.0);
	}

	touch_start(integer total_number)
	{
		llSay(-1624, "C");
	}
}
