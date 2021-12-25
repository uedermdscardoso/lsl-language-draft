default
{
	// touch_start = quando voce CLICA e SOLTA o bot�o esquerdo do mouse executa o comando
	touch_start(integer x)
	{
		llSetScale(llGetScale()-<0,0,1>); // vai fechar -1 de alura
		llSay(-1624, "1"); // vai enviar mensagem "1" pelo canal -1624
	}
	touch_end(integer x) // touch_end = quando voce SOLTA o bot�o esquerdo do mouse executa o comando
	{
		llSetScale(llGetScale()+<0,0,0.5>);
	}
}
