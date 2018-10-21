integer count;
default
{
	touch_start(integer total_number)
	{
		count++;

		if(count == 1) //abrir
		{
			llSetScale(<0.046,0.200,2.995>);
		}
		else if(count = 2) //fechar
		{
			llSetScale(<0.046,2.898,2.995>);
			llResetScript();
		}
	}
}
