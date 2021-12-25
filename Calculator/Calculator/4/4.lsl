default
{
	touch_start(integer x)
	{
		llSetScale(llGetScale()-<0,0,1>);
		llSay(-1624, "4");
	}
	touch_end(integer x)
	{
		llSetScale(llGetScale()+<0,0,0.5>);
	}
}
