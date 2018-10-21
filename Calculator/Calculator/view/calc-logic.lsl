integer CanalNum = -1624;
integer CanalSimb = -1625;
integer troca;
string Operador = "nada";
integer calculo;
float calculof;
string letraa;
string letrab;
string letrac;
integer  count = 0;
integer chaveA = 1;
integer a;
integer b;
integer c;
string MostSinal = "";
string MostIqual = "";
default
{
	state_entry()
	{
		llListen(CanalNum, "", NULL_KEY, "");
		llListen(CanalSimb, "", NULL_KEY, "");
	}

	//Evento para responder ao ouvir o "llListen"
	listen (integer canal, string nome, key id, string msg)
	{

		troca = (integer)msg;
		if(canal == CanalNum && troca >= 0 && troca <=9)
		{
			//llSetText(letraa,<0,1,0>,1.0);
			//Filtro do a - come�o
			if (chaveA == 1 && count == 0)
			{
				if(llStringLength(letraa)<20)
				{
					letraa = llInsertString(letraa,2,msg);
					a = (integer)letraa;
					llSetText(letraa,<0,1,0>,1.0);} /*fim*/
			}

			//Filtro do b - come�o
			if (chaveA == 2 && count == 1)
			{
				if(llStringLength(letrab)<20)
				{
					letrab = llInsertString(letrab,2,msg);
					b = (integer)letrab;
					llSetText(MostSinal + letrab,<0,1,0>,1.0);}} /*fim do filtro*/

				//Filtro do c - come�o
				if (chaveA == 3 && count == 2)
				{
					if(llStringLength(letrac)<20)
					{
						letrac = llInsertString(letrac,2,msg);
						c = (integer)letrac;
						llSetText(MostSinal + letrac,<0,1,0>,1.0);}} /*-fim do filtro*/                                   }//chave fim do primeiro if


					//llSay(0,"a: " + letraa);
					//llSay(0,"b: " + letrab);
					//llSay(0,"c:" + letrac);


					//bot�o ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
					if (msg == "+" && canal == CanalSimb)
					{
						count += 1;
						//llSay(0,"count: " + (string)count);

						if (count == 1){
							chaveA = 2;
							MostSinal = letraa + "+";
							//llSay(0,"clicou no mais");
							llSetText(MostSinal,<0,1,0>,1.0);
							Operador = "mais";}

						if (count == 2){
							chaveA = 3;
							MostSinal = letraa + "+" + letrab + "+";
							//llSay(0,"Voce clicou no mais");
							llSetText(MostSinal,<0,1,0>,1.0);
							Operador = "3opsmais";} //3ops = 3 operanos para ser operados
					}

					//bot�o vezes ****************************************************************************
					if (msg == "*" && canal == CanalSimb)
					{
						count += 1; // count = contador do bot�o
						//llSay(0,"count: " + (string)count);

						if (count == 1){
							chaveA = 2;
							MostSinal = letraa + "*";
							//llSay(0,"clicou no mais");
							llSetText(MostSinal,<0,1,0>,1.0);
							Operador = "vezes";}

						if (count == 2){
							chaveA = 3;
							MostSinal = letraa + "*" + letrab + "*";
							//llSay(0,"Voce clicou no vezes");
							llSetText(MostSinal,<0,1,0>,1.0);
							Operador = "3opsvezes";} //3ops = 3 operanos para ser operados
					}


					//bot�o divis�o //////////////////////////////////////////////////////////////////////////
					if (msg == "/" && canal == CanalSimb)
					{
						count += 1; // count = contador do bot�o
						//llSay(0,"count: " + (string)count);

						if (count == 1){
							chaveA = 2;
							MostSinal = letraa + "/";
							//llSay(0,"clicou no mais");
							llSetText(MostSinal,<0,1,0>,1.0);
							Operador = "dividir";}

						if (count == 2){
							chaveA = 3;
							MostSinal = letraa + "/" + letrab + "/";
							//llSay(0,"Voce clicou na divis�o");
							llSetText(MostSinal,<0,1,0>,1.0);
							Operador = "3opsdividir";} //3ops = 3 operanos para ser operados
					}


					//bot�o menos -----------------------------------------------------------------------------
					if (msg == "-" && canal == CanalSimb)
					{
						count += 1; // count = contador do bot�o
						//llSay(0,"count: " + (string)count);

						if (count == 1){
							chaveA = 2;
							MostSinal = letraa + "-";
							//llSay(0,"clicou no mais");
							llSetText(MostSinal,<0,1,0>,1.0);
							Operador = "subtrair";}

						if (count == 2){
							chaveA = 3;
							MostSinal = letraa + "-" + letrab + "-";
							//llSay(0,"Voce clicou no menos");
							llSetText(MostSinal,<0,1,0>,1.0);
							Operador = "3opsmenos";} //3ops = 3 operanos para ser operados
					}

					//BOT�O IQUAL ============================================================================
					if (msg == "=" && canal == CanalSimb)
					{

						//++++++ SOMENTE DO MAIS ++++++++++++
						if (Operador == "mais")
						{calculo = a+b;
								MostIqual = MostSinal + letrab + "=" + (string)calculo;
								/*llSay(0, "Resultado: " + (string)calculo);*/}

						if (Operador == "3opsmais")
						{calculo = a+b+c;
								MostIqual = MostSinal + letrac + "=" + (string)calculo;
								/*llSay(0, "Resultado: " + (string)calculo);*/}

						//                                //                                  //

						// ********** SOMENTE DO VEZES *********
						if (Operador == "vezes")
						{calculo = a*b;
								MostIqual = MostSinal + letrab + "=" + (string)calculo;
								/*llSay(0, "Resultado: " + (string)calculo);*/}

						if (Operador == "3opsvezes")
						{calculo = a*b*c;
								MostIqual = MostSinal + letrac + "=" + (string)calculo;
								/*llSay(0, "Resultado: " + (string)calculo);*/}

						//                             //                                    //

						//../////////// SOMENTE A DIVIS�O /////////
						if (Operador == "dividir")
						{calculof = (float)a/(float)b;
								MostIqual = MostSinal + letrab + "=" + (string)calculof;
								/*llSay(0, "Resultado: " + (string)calculo);*/}

						if (Operador == "3opsdividir")
						{calculof = (float)a/(float)b/(float)c;
								MostIqual = MostSinal + letrac + "=" + (string)calculof;
								/*llSay(0, "Resultado: " + (string)calculo);*/}

						//                             //                                    //

						//-------- SOMENTE O MENOS ------------
						if (Operador == "subtrair")
						{calculo = a-b;
								MostIqual = MostSinal + letrab + "=" + (string)calculo;
								/*llSay(0, "Resultado: " + (string)calculo);*/}

						if (Operador == "3opsmenos")
						{calculo = a-b-c;
								MostIqual = MostSinal + letrac + "=" + (string)calculo;
								/*llSay(0, "Resultado: " + (string)calculo);*/}

						//                            //                                    //

						llSetText(MostIqual,<0,1,0>,1.0); Operador = "";
						llResetScript();
					}//essa chave � o fim do listen
					//bot�o apagar
					if (msg == "C"){llSetText("",<1,0,0>,1.0); llResetScript();}
				}
			}