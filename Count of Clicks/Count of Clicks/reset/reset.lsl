list reset = ["Sim","Não"];

string dono;
string pessoa;
default
{
	touch_start(integer x)
	{
		llDialog(llDetectedKey(0),"Você deseja resetar?",reset,3333);
		llListen(3333,"","","");

		dono =  llKey2Name(llGetOwner());
		pessoa = llDetectedName(0);
	}

	listen (integer canal, string nome, key id, string msg)
	{
		if(msg == "Sim" && pessoa == dono){llSay(3334,"Reset"); llSay(0,"Resetado.");}
	}
}
