integer canal_click = 1111;
integer canal_click_unidade = 2222;
integer canal_reset = 3334;

string limite;
string click;
string dezena;
default
{
	state_entry()
	{
		limite = "50";
		string numero = llGetInventoryName(INVENTORY_TEXTURE, 0);
		llSetTexture(numero, 3);
		llScaleTexture(0.100,0.200,3);
		llOffsetTexture(-0.412,0.000,3);

		llListen(canal_click, "", NULL_KEY, "");
		llListen(canal_click_unidade, "", NULL_KEY, "");
		llListen(canal_reset, "", NULL_KEY, "");
	}

	listen (integer canal, string nome, key id, string msg)
	{
		if(canal == canal_reset && msg == "Reset"){llResetScript();}
		if(canal == canal_click_unidade){dezena = msg;}

		if(llGetSubString((string)dezena, 1, 1) == "0"){llOffsetTexture(-0.412,0.000,3);}
		if(msg == "1" || llGetSubString((string)dezena, 1, 1) == "1"){llOffsetTexture(-0.320,0.000,3);}
		if(msg == "2" || llGetSubString((string)dezena, 1, 1) == "2"){llOffsetTexture(-0.230,0.000,3);}
		if(msg == "3" || llGetSubString((string)dezena, 1, 1) == "3"){llOffsetTexture(-0.139,0.000,3);}
		if(msg == "4" || llGetSubString((string)dezena, 1, 1) == "4"){llOffsetTexture(-0.048,0.000,3);}
		if(msg == "5" || llGetSubString((string)dezena, 1, 1) == "5"){llOffsetTexture(0.044,0.000,3);}
		if(msg == "6" || llGetSubString((string)dezena, 1, 1) == "6"){llOffsetTexture(0.135,0.000,3);}
		if(msg == "7" || llGetSubString((string)dezena, 1, 1) == "7"){llOffsetTexture(0.226,0.000,3);}
		if(msg == "8" || llGetSubString((string)dezena, 1, 1) == "8"){llOffsetTexture(0.316,0.000,3);}
		if(msg == "9" || llGetSubString((string)dezena, 1, 1) == "9"){llOffsetTexture(0.408,0.000,3);}

		if(msg == limite || dezena == limite){llSay(2223,"50");}
	}
}
