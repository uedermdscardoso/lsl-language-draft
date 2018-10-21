default
{
	touch_start(integer x)
	{
		llSetScale(llGetScale()-<0,0,1>);
		llSay(-1624, "7");
	}
	touch_end(integer x)
	{
		llSetScale(llGetScale()+<0,0,0.5>);
	}
}
