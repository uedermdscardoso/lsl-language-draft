integer canal_click_dezena = 2222;
integer canal_reset = 3334;

string click;
string dezena;
default
{
	state_entry()
	{
		string numero = llGetInventoryName(INVENTORY_TEXTURE, 0);
		llSetTexture(numero, 3);
		llScaleTexture(0.100,0.200,3);
		llOffsetTexture(-0.412,0.000,3);

		llListen(canal_click_dezena, "", NULL_KEY, "");
		llListen(canal_reset, "", NULL_KEY, "");
	}

	listen (integer canal, string nome, key id, string msg)
	{
		if(canal == canal_reset && msg == "Reset"){llResetScript();}
		if(canal == canal_click_dezena){dezena = msg;}

		if(llGetSubString((string)dezena, 0, 0) == "1"){llOffsetTexture(-0.320,0.000,3);}
		if(llGetSubString((string)dezena, 0, 0) == "2"){llOffsetTexture(-0.230,0.000,3);}
		if(llGetSubString((string)dezena, 0, 0) == "3"){llOffsetTexture(-0.139,0.000,3);}
		if(llGetSubString((string)dezena, 0, 0) == "4"){llOffsetTexture(-0.048,0.000,3);}
		if(llGetSubString((string)dezena, 0, 0) == "5"){llOffsetTexture(0.044,0.000,3);}
	}
}